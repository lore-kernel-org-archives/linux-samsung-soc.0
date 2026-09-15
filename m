Received: from mail-qk2-f12.google.com (mail-qk2-f12.google.com [74.125.230.204])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D43653D523F
	for <linux-samsung-soc@vger.kernel.org>; Tue, 15 Sep 2026 15:01:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.204
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789484499; cv=none; b=G4xdh8OtkUwey/x21FGcikq3l4hC1eRB6NFlITHrC4xsU5yQmMjjG7yiZ76BdWZyVlRBOpPu0KLc6ovmY9kBBNEBtd5dc7OBflCadTkJhidPbQW34JWpxwO7aO4XYdoAtCuNobMbV4N2kqYzlHQGF4qhJqs5Qz1sKvE9yM6i1VU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789484499; c=relaxed/simple;
	bh=1fbdwqra8hcU7hJAomibU8hl7s8ORH+jeNUHHdUh8m8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=a5WOT4/woOc3PqEVMJt3fqkeCDL3FNtDe5JQjQCuJaXJ5aAUoi2UQmN3ILOlrSkv2jJvOajxPeEqhgcWfk+owOAD1zIPl/FBuFaRe4xP6fHi0qfGbWKQUUnb2WGgpg5TSZOIcvFx2iXYH0f/fvPGoqRlLu2JapZDKzIlXwFsVX4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=WTU6DjiR; arc=none smtp.client-ip=74.125.230.204
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="WTU6DjiR"
Received: by mail-qk2-f12.google.com with SMTP id d75a77b69052e-52fb76ec392so2769891cf.1
        for <linux-samsung-soc@vger.kernel.org>; Tue, 15 Sep 2026 08:01:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1789484496; x=1790089296; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=g9rzR4FHW24jqWw2J2lJ2bk+jLthZKfD8kBK912Z0ag=;
        b=WTU6DjiR+wcEQtib1n2Jn+NHwfCFueZ5gcOzxaBTsYmCsABGQRSp500/lYpukcCQ8Z
         F3qZWXieZUQMk8PUiPl4wRTOtSPMS7B+i4XdnHmL7oUn5Atph3AeBSaoDP6sBFqbd8n/
         FQ7uYGLC2ghWJqKE7t7ycs20ywSBNM5EYPUqu/uO+o/dVsphYn4NquJaS32Oaqkqxfjl
         95VazU7SViBjOFgp0ocZSjkEiL2hkeyVAEW32oLAq/44rIaHw/OPxCwi+/5iTpRFq/eH
         iR8WP5xYJEF1NgyitAfWQCrt8MLCsgQg2eeTyS02txeJOjHD6X501x3akjb5+khaQMIS
         /DVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789484496; x=1790089296;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=g9rzR4FHW24jqWw2J2lJ2bk+jLthZKfD8kBK912Z0ag=;
        b=mo45DiwN9aW5W5sZZR6yOrF3xj/+cKfWOjiaxD+zRoHYX9xIkMRB5H7vr9yB4K/Qti
         N/geGL7Rck6Q6bTwH5klEtgruRGXsKcFQtLYcD/ztDnr2RTNnnEH36k2uBYTs5h7I8hC
         6cUKXx0pXNUY2ZeyCSO8MstDWbdt1vAgiT+4X050cSdAlT/EvKEsLQ8YX4zjGaw4yuam
         Nl5LHGZ7wCrAnHzcKA/tZvPsLosFBzd/bYMjpO2acQg6vce5UGIPr4cNg7lD8iYtq6Mc
         M0hUIlD8XTvXwRd90PTUylj2FJDuZv5BrP4FPyvI5YdbJgUalLM19SAqYZ/MS7grpM3n
         iU6A==
X-Forwarded-Encrypted: i=1; AKwUvBxHWgEiXgJBkSqzQXQC5elB3Q7A3Kdggvbh8uD60PnEbpo4agJdG7urZYId2cSDsnrhmqSgWsX9FA1lHZpLWFnUaw==@vger.kernel.org
X-Gm-Message-State: AFuF++mNlh0J7GuZoBMlh89v68ckUVvhPnANyKN4mKZ/EF2oQWplwwiA
	V0v1ubrXCpcThBzik/TswO3yLC12RyWHrX9XKk6poKVmk3WlyRnzOr6hUI36q5WYZVHz0ZOL36C
	ueGrqdQ==
X-Gm-Gg: AYBFou3I1LjCrZNnV6EelellxnpLcChJjksp5+is2yoA1pGGgOFP3B2RIFLqkTAp7Xi
	4JT6r4lMe5EnRnbp1pKjtvnagiC+YYB0kBtHvxXn2Ec6+kI+XHRJ40nxK7TqYVBWoycIYp7uZe7
	P4paQCaWPjboNRKLoyh7LCGRSZLqVDTAaHmR1ujx66N0cHQ2FZtVyPeP1w61DYOa/+V6V7E6ujU
	92whjTf0Eilgh8HBPnF+6V5pguP0xlHavP3mFvc4CRBdtbZyT+t2EZyEmYmkSJVbY7FnAiiZMsl
	W7kyQoEbvfzpDsngOkt/QyX+xZ3Cj3Yz/SbxWa3ufqF5PhSbPJvJNHS7ZD45aOuEXL1s4kqgrcA
	e7PmszklMPTB5piFupqgjsLMIX+QDOnuJIIFy62JBXl4e6CYJFH3zL6EErwsWW+1oglkGAWjkpN
	JCJ4+ToD0IVvLgVWY5WGios3BxMm6I9u5+FL2Cq7hqDpRZ3NK2h6CtZILM2NRM34Yw/1wXPEJW
X-Received: by 2002:a05:622a:1dcf:b0:530:e7aa:ef4e with SMTP id d75a77b69052e-5312626d895mr19384701cf.16.1789484495571;
        Tue, 15 Sep 2026 08:01:35 -0700 (PDT)
Received: from rowland.harvard.edu ([2601:19b:d01:d210::7544])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-53116090064sm34071481cf.5.2026.09.15.08.01.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 08:01:34 -0700 (PDT)
Date: Tue, 15 Sep 2026 11:01:32 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Myeonghun Pak <mhun512@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Peter Griffin <peter.griffin@linaro.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Patrice Chotard <patrice.chotard@foss.st.com>,
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH 0/4] usb: ohci: Balance controller wakeup on cleanup
Message-ID: <c65da485-90f3-4393-8836-3b793047bfc4@rowland.harvard.edu>
References: <20260915012011.61874-1-mhun512@gmail.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260915012011.61874-1-mhun512@gmail.com>

On Mon, Sep 14, 2026 at 09:20:07PM -0400, Myeonghun Pak wrote:
> These four independent fixes disable controller wakeup after HCD removal
> in the DA8xx, S3C2410, SPEAr and ST drivers. DA8xx also needs the same
> cleanup when notifier registration fails after the HCD is added.
> 
> This issue was identified during our ongoing static-analysis research
> while reviewing kernel code.
> 
> Assisted-by: LLM
> 
> Myeonghun Pak (4):
>   usb: ohci-da8xx: disable controller wakeup on cleanup
>   usb: ohci-s3c2410: disable controller wakeup on removal
>   usb: ohci-spear: disable controller wakeup on removal
>   usb: ohci-st: disable controller wakeup on removal

For all four patches:

Acked-by: Alan Stern <stern@rowland.harvard.edu>

