/*************************************************************/
/* Copyright (c) 2011,2015,2024 by Progress Software Corporation  */
/*                                                           */
/* all rights reserved.  no part of this program or document */
/* may be  reproduced in  any form  or by  any means without */
/* permission in writing from progress Software Corporation. */
/*************************************************************/ 
 /*------------------------------------------------------------------------
    File        : User
    Purpose     : 
    Syntax      : 
    Description : 
    Author(s)   : hdaniels
    Created     : Fri Jun 25 13:09:35 EDT 2010
    Notes       : 
  ----------------------------------------------------------------------*/
routine-level on error undo, throw.
using OpenEdge.DataAdmin.IUser from propath.
using OpenEdge.DataAdmin.Entity from propath.
using OpenEdge.DataAdmin.Binding.IDataAdminModel from propath.
using OpenEdge.DataAdmin.IDomain from propath.
using OpenEdge.DataAdmin.ITenant from propath.
using OpenEdge.DataAdmin.IRequestInfo from propath.
using Progress.Lang.* from propath.
 
class OpenEdge.DataAdmin.User inherits Entity implements IUser: 

	 /** The Domain of the user.   
         The Domain:Name makes up the second part of the unique identifier.  (name@domainname) */     
     define public property Domain as IDomain no-undo     
        get():
             if not valid-object(Domain) then
             do:
                 /* do  not assign since the setter changes buffer and will set 
                    row-modified  - (the domain is cached in service) */
                 if valid-handle(mBuffer)  
                 and valid-object(Service) then
                     return Service:GetDomain(mBuffer::DomainName).            
             end.
             return Domain.
        end.
        set(pDomain as IDomain):
            /* 
            if valid-object(Service) then 
                undo, throw new ReadOnlyPropertyError("User",name,"Domain").
            */
            if valid-handle(mBuffer) then
            do:
                mDefaultBuffer:find-by-rowid(mBuffer:rowid).  
                mdefaultbuffer::DomainName = pDomain:Name.
            end.
            Domain = pDomain.
        end. 
        
    /** The Tenant of the user (as defined by the Domain) */
    define public property Tenant as ITenant no-undo 
        get():
             if valid-object(Domain) then 
                 return Domain:Tenant.
                  
             if not valid-object(Tenant) 
             and valid-handle(mBuffer) 
             and valid-object(Service) then
             do:
                 /* do  not assign since the setter changes buffer and will set 
                    row-modified  - (the tenant is cached in service) */
                 if mBuffer::TenantName > "" then 
                     return Service:GetTenant(mBuffer::TenantName).            
                 else if mBuffer::TenantId <> ? then 
                     return Service:GetTenant(mBuffer::TenantId).            
             end.
             return tenant.
        end.     
        private set.
    
     /** The unique identifier of the user  (name@domainname) */
     define public property Id as character no-undo     
        get():
            define variable cDomain as character no-undo.
             cDomain = if valid-object(Domain) then Domain:Name
                       else if valid-handle(mbuffer) then mBuffer::DomainName 
                       else "". 
             return name 
                   + if cDomain > "" 
                     then "@" + cDomain
                     else "".
         end.
   
     /** An optional description of the user. */
    define public property Description as character no-undo     
        get():
            if valid-handle(mBuffer) then
                return mBuffer::Description.
            else
                return Description. 
        end.
        set(pDescription as character):
            if valid-handle(mBuffer) then
            do:
                mDefaultBuffer:find-by-rowid(mBuffer:rowid).  
                mdefaultbuffer::Description = pDescription.
            end.
            Description = pDescription.
        end. 
 
      /** The given name of the user. (optional) */
    define public property GivenName as character no-undo     
        get():
            if valid-handle(mBuffer) then
                return mBuffer::GivenName.
            else
                return GivenName. 
        end.
        set(pGivenName as character):
            if valid-handle(mBuffer) then
            do:
                mDefaultBuffer:find-by-rowid(mBuffer:rowid).  
                mdefaultbuffer::GivenName = pGivenName.
            end.
            GivenName = pGivenName.
        end. 
    
    /** The middle intial of the user. (optional) */
    define public property MiddleInitial as character no-undo     
        get():
            if valid-handle(mBuffer) then
                return mBuffer::MiddleInitial.
            else
                return MiddleInitial. 
        end.
        set(pMiddleInitial as character):
            if valid-handle(mBuffer) then
            do:
                mDefaultBuffer:find-by-rowid(mBuffer:rowid).  
                mdefaultbuffer::MiddleInitial = pMiddleInitial.
            end.
            MiddleInitial = pMiddleInitial.
        end. 
    
    /** The surname (familyname, lastname) of the user. (optional) */
    define public property SurName as character no-undo     
        get():
            if valid-handle(mBuffer) then
                return mBuffer::SurName.
            else
                return SurName. 
        end.
        set(pSurName as character):
            if valid-handle(mBuffer) then
            do:
                mDefaultBuffer:find-by-rowid(mBuffer:rowid).  
                mdefaultbuffer::SurName = pSurName.
            end.
            SurName = pSurName.
        end. 
    
    /** The password. Can only be edited by the actual user  */
    define public property Password as character no-undo     
        get():
            if valid-object(Service) then 
                return "********".

            if valid-handle(mBuffer) then
                return mBuffer::Password.
            else 
                return Password. 
        end.
        set(pPassword as character):
            if valid-handle(mBuffer) then
            do:
                mDefaultBuffer:find-by-rowid(mBuffer:rowid).  
                mdefaultbuffer::Password = pPassword.
            end.
            Password = pPassword.
        end. 
        
    /** Set to true if the user is an SQL only user. (ignored by ABL runtime)*/
    define public property IsSqlOnly     as logical no-undo  
        get():
            if valid-handle(mBuffer) then
                return mBuffer::IsSqlOnly.
            else
                return IsSqlOnly. 
        end.
        set(pIsSqlOnly as logical):
            if valid-handle(mBuffer) then
            do:
                mDefaultBuffer:find-by-rowid(mBuffer:rowid).  
                mdefaultbuffer::IsSqlOnly = pIsSqlOnly.
            end.
            IsSqlOnly = pIsSqlOnly.
        end. 
 
    /** A telephone number for the user (optional) */
    define public property Telephone as character no-undo     
        get():
            if valid-handle(mBuffer) then
                return mBuffer::Telephone.
            else
                return Telephone. 
        end.
        set(pTelephone as character):
            if valid-handle(mBuffer) then
            do:
                mDefaultBuffer:find-by-rowid(mBuffer:rowid).  
                mdefaultbuffer::Telephone = pTelephone.
            end.
            Telephone = pTelephone.
        end. 
    
    /** A User number for the user (optional) */
    define public property Number as integer no-undo     
        get():
            if valid-handle(mBuffer) then
                return mBuffer::Number.
            else
                return Number. 
        end.
        set(pNumber as integer):
            if valid-handle(mBuffer) then
            do:
                mDefaultBuffer:find-by-rowid(mBuffer:rowid).  
                mdefaultbuffer::Number = pNumber.
            end.
            Number = pNumber.
        end. 
        
    /** An email address for the user (optional) */
    define public property Email as character no-undo     
        get():
            if valid-handle(mBuffer) then
                return mBuffer::Email.
            else
                return Email. 
        end.
        set(pEmail as character):
            if valid-handle(mBuffer) then
            do:
                mDefaultBuffer:find-by-rowid(mBuffer:rowid).  
                mdefaultbuffer::Email = pEmail.
            end.
            Email = pEmail.
        end.

    define public property IsSecAdmin as logical no-undo     
        get():
            if valid-handle(mBuffer) then
                return mBuffer::IsSecAdmin.
            else
                return IsSecAdmin. 
        end.		

	constructor public User(cntxt as IDataAdminModel):
        super (cntxt).
    end constructor.
    
    constructor public User(cntxt as IDataAdminModel,pReq as IRequestInfo):
        super (cntxt,pReq).
    end constructor. 
    
    constructor public User (cname as character):
        super (cname).
    end constructor. 
    
    method protected  override IDataAdminModel CreateLocalContext():
        return ?.
    end method.
    
    method public override void ExportTree(pcfile as char):
        this-object:Export(pcFile).
    end method.     
     	
	method public override void Export(  ):
		this-object:Export("users.json").  
	end method.
	 
    /** workaround due to inconsistent key definition (and property reflection) 
         override in classes that does not use name */
    method protected override char extent GetKeyValues():
        define variable c as character extent 1 no-undo.
        c[1] = GetKeyValue().
        return c.
    end method.

    method protected override char GetKeyValue():
        return this-object:Id.
    end method.

    method override protected logical NeedsRefresh(  ):
        return mBuffer::TenantId <> ? and mBuffer::TenantName = "".
    end method.
                   
end class.
