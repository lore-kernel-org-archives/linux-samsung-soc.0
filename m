Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC3162E84E
	for <linux-samsung-soc@vger.kernel.org>; Fri,  5 Apr 2024 07:19:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712301582; cv=none; b=EH5p49Pt0Vz/ZXVvLU0aL4UO2zIBP9/y7s7BL7yNiW/wBBMmrQnloUyedTRDpcRlDeggZ2AzpOP5ASu1PbTyC7lZEGWhNv2fXO8I11XZrNSprDsQ2dbxTKSvi6hs2RjrswoXJS1+Nit6UMOuTf+9tBtafFYOiMhwYFGJYiCeGyI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712301582; c=relaxed/simple;
	bh=wLAttUaMHKCtdPX1WWBnpNXpXFsqBqC4m05I7O08oiU=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=mJ+n5XnntKPTQfHMCwYb3cwW8BJ9bp80p+7k9r/hsbna1i141mN1QF3Qng+KwHaxWmu3wteyG7QC/E2ifi0ZQwrTgw4FwOJmihcnFaWJWq7/7vcm84PG4Z+rVgh06zQPo6EmPsLm/KeBMSfttrhjMuQeSsQZ2V3fiHfnx4N6YKI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=q7RZvGFh; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="q7RZvGFh"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4162b7f18b6so9452765e9.3
        for <linux-samsung-soc@vger.kernel.org>; Fri, 05 Apr 2024 00:19:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1712301578; x=1712906378; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=wLAttUaMHKCtdPX1WWBnpNXpXFsqBqC4m05I7O08oiU=;
        b=q7RZvGFhDvJO2C77qte5PiGbaPDQExzhyH+btKSIrfbwDg3SBLkhnufw7ug/7KldLh
         eqMdPXp1b/PsTvuIES0zQFSr1hg7gQAqunAs312Sc1/2Uy+N7KPEfCoWgTGrp9e8LOKd
         nT1aYfUrt0/kiVgupWcx+ALjSDY/wtHxcIeoyjfKdp5OLHl0256jtzfruTnXxm/inVNx
         NxPijSxhuGrjMwVY57vjzzQwRbfDNeGIrEln1Eu0cmRIYmEi04BgTY1rc4CS3EMezJVT
         BNr6yocJQayjrk1Id8ZrFQsuFD9vcMWgYAqDYNJxm+J/kS4QT9BC1HBMRIVmSx3ZSPNw
         Gd9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712301578; x=1712906378;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=wLAttUaMHKCtdPX1WWBnpNXpXFsqBqC4m05I7O08oiU=;
        b=Hb6qSbsMhN8c+qF8k8A8x2novGuXlWXV6H96qUsTx+GSpJmtPV4fNdkkAc+chkBn2k
         mwfUwmVP66K9p5dNmDqVFZD8xE/LHMjMQ7MeHuulQdRjyPt9iTX9nYq+G23URJFBJuRl
         xQPnfOWM/OwoxuqlQLafkslAw8IjIjLXylVGI3dCck2eJeU6txcD3ht9SpO6eKz5rH5A
         ddu1Ay1eMGYDzrQjbxzG905ERR/HhGZegs7FGMSS7NOUaj2TPNyKvZGwDv6k9aly+UGa
         wxXw6V41gjIWjxEqEGlUnfK1/YlHPcxJDBvUdW7IUYrFTobKDT3bT4eHJVi8Ii9TG6OP
         7qBA==
X-Forwarded-Encrypted: i=1; AJvYcCXWy+ysnVxpnH1EBn19z9iOKknAtK4ApFwhDyATCNqPOdKRVSE4+4HnZDsFRHSvxS/336lpLzN3zYCcaN+IE8NhWjamhYYdEeBiAH/qWplhIgk=
X-Gm-Message-State: AOJu0Yz+Dm4jssfTrjVX+gIBjgFwQKUfGJGknoW3rH+rryyIU/ZONAps
	HALfRAz+Al+gdUNi7Mjh89OozJmjqABtm3b1yLxj8d3eI4XR/n87LOa71EHNowg=
X-Google-Smtp-Source: AGHT+IFbrCW33dSXgPiQ+eoAkzDxZI2m/BJwNp+mTFmhPeWQoinz7PCnNwEKOC0Vi6S+DLAAdKT1nQ==
X-Received: by 2002:a05:600c:3486:b0:416:321d:5a47 with SMTP id a6-20020a05600c348600b00416321d5a47mr63398wmq.0.1712301578095;
        Fri, 05 Apr 2024 00:19:38 -0700 (PDT)
Received: from draszik.lan ([80.111.64.44])
        by smtp.gmail.com with ESMTPSA id h12-20020adfa4cc000000b00343668bc492sm1295285wrb.71.2024.04.05.00.19.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Apr 2024 00:19:37 -0700 (PDT)
Message-ID: <52f97f540725a25893e0ca35ddd5b637a83c31b4.camel@linaro.org>
Subject: Re: [PATCH 02/17] dt-bindings: soc: google: exynos-sysreg: add
 dedicated hsi2 sysreg compatible
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>
To: Peter Griffin <peter.griffin@linaro.org>, mturquette@baylibre.com, 
 sboyd@kernel.org, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
  vkoul@kernel.org, kishon@kernel.org, alim.akhtar@samsung.com,
 avri.altman@wdc.com,  bvanassche@acm.org, s.nawrocki@samsung.com,
 cw00.choi@samsung.com,  jejb@linux.ibm.com, martin.petersen@oracle.com,
 chanho61.park@samsung.com,  ebiggers@kernel.org
Cc: linux-scsi@vger.kernel.org, linux-phy@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, tudor.ambarus@linaro.org, 
	saravanak@google.com, willmcvicker@google.com
Date: Fri, 05 Apr 2024 08:19:36 +0100
In-Reply-To: <20240404122559.898930-3-peter.griffin@linaro.org>
References: <20240404122559.898930-1-peter.griffin@linaro.org>
	 <20240404122559.898930-3-peter.griffin@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.50.3-1 
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Thu, 2024-04-04 at 13:25 +0100, Peter Griffin wrote:
> Update dt schema to include the gs101 hsi2 sysreg compatible.
>=20
> Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
> ---
> =C2=A0.../devicetree/bindings/soc/samsung/samsung,exynos-sysreg.yaml=C2=
=A0 | 2 ++
> =C2=A01 file changed, 2 insertions(+)

Reviewed-by: Andr=C3=A9 Draszik <andre.draszik@linaro.org>

