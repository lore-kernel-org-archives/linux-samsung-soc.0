Received: from mail-ua1-f45.google.com (mail-ua1-f45.google.com [209.85.222.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD3862951D2;
	Fri, 27 Jun 2025 10:15:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751019353; cv=none; b=ng3KGiM+XNn9E9XnoR7QNxs3oxFXGuEM6oeR1DA0DeH2irTs4CHPimk6fUqtl30RGEJPe/d0tJAWCKUOd5f613/xaq8VOZwd8hu1miriGeKwyvv97SGvj5EKjnDJiMV+KM0ZWuNue8cpWAVp/nr4R7dvRz4SPTK5ISbH2izE590=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751019353; c=relaxed/simple;
	bh=pW074c8bdu9mmtPtvWTBAb36uXFMxr1vMpn/ANOpnqI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=otdKfNOjgeyYt8Ggnt9NkM8H9jhRpfMBKjVRZqFTaBosa+kct5VC/R4GcMPoS3rw4EQPdi7XXPOBLZz7Nl9CkYuHZoWr16B79aJhy3w0kL1eSnYhOK0Lgy6o4Hx6iuWsGOM07Ie5edG+SFB6vYnYqd8SQcOiakuY0Lvu3pW/d0c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MU2Le/vc; arc=none smtp.client-ip=209.85.222.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MU2Le/vc"
Received: by mail-ua1-f45.google.com with SMTP id a1e0cc1a2514c-87f04817bf6so1323180241.0;
        Fri, 27 Jun 2025 03:15:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751019351; x=1751624151; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=W3qFR7cfAS/X16LAzwLj/wNbMxrS9YVqLflPC6mFUYo=;
        b=MU2Le/vctrfqhSR0jvozhjIcwuVE1JNhQPN6E8QBuTofxBTYtUJ3dscCr5WeWGjBhY
         BX1Tga4tWbX/tzKAu9ssq4cHNbZTb7KlzJDYfx4U0x22hqobNGSzYGmYyQ/7ii4+nXRA
         Zl9YCpF+xQ0lDK/wCQ4iD/sbq1dyVAM6+qEwJVbL2PYsKuEE6UYbi80pW1Mx1OyiP69M
         OG9AHcz2wqX4jC/83xrJkOkDZQP2Y8WPOnq62AWnpTeFZWdsuaN4RqsbbscYL+5XbIwk
         RhYq1eICNc39D8cfI11RxjUri7PbcNJAP5jz8dl96fv/HbKDBFHfj5um1Ri1L1TwltX5
         qwFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751019351; x=1751624151;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=W3qFR7cfAS/X16LAzwLj/wNbMxrS9YVqLflPC6mFUYo=;
        b=sB4p+UjlhAion9Wxc1mDLu09H4Jhu5DwTh8OCEn0GUpiL0Qul+KDn0k4I0y4Bh0Tf7
         9nIF85x43IiQQGWZOsuQ1lOwlMoO0xqECPtyMsdhnie7x99GfeghazLZEyTybUncPuIF
         6IHsZSSj5L9miphkv0B0M0I83ENrRUoJyz72IrvjpVrsqeuPYjn48XQMyZOCbv21Ec+n
         Vcx39FBJrTXrm34Ng78VnAQwiIfei+gBkiKhsj5iS//xICACVVrD8QvcSUdxqGb+nDwD
         YEKVbPQhewMvmeiykG4WEcUozhtnn2sIYuzYXTiLCGD4slLLApErSdeEEfWs0x8qPPg9
         Q5NQ==
X-Forwarded-Encrypted: i=1; AJvYcCUGRIOhgEq/ESPRYEvm20Xixl7yiQsiKSLYsYjVY/ceCn/8flplVX1vlITk0nZIrI6rPt08+rcM0n0Z@vger.kernel.org, AJvYcCV5uTO9fwiRmV8rI1a/6Lw3QOcs9I+hterHEFydvuasxtAbUA7p7+WgkIocasnFMDL066FagBQ4btUU+hpO@vger.kernel.org, AJvYcCVqiTOQp4hvhC0Bn02bnsR9uWrfRlfeYRDkiCPUemp6PzL7kOE82omQMG/UMFQCURBebjxzf7V7GzfBZ0GOPXEK6OU=@vger.kernel.org
X-Gm-Message-State: AOJu0YxwqOrhVw4RFs+D2Ua7j/Pl9PMdcfMilzRqAZqwQQdGMRnXYa4Q
	iqCXvGqAzNmdcYbE5sEyg95GOODUm7kDeIyRfrLFLccEzK03yubDb6v6Ubhdvdh0S8uLU8jlIPw
	InYzNlB+A7WnocsNKSvv43Fy01Uf+xYM=
X-Gm-Gg: ASbGnctIpdYgX10TiHzMB5tvD4UUXsshbrOLPkpI8MBRmGupz52O9kSuBUEFnyQdvuu
	S1yUENKSgpocuqSlTqHiRsbFd6l/ARZw4n2I3CJjnw5uxE2LMjBt+HNs+hTCCnVmr6l7rwP59bE
	wlohl2UaavkHDBG2868EljNz9g9VVtNEesoAwsvv4y8w==
X-Google-Smtp-Source: AGHT+IF+zTXlE8TphxlFmfZTtMV7oCo6MYa180Y0AG9PxdjoTKxOQADyJ71mo4br1mdkRgwuFP5aO2OpnO/3e6XLJPA=
X-Received: by 2002:a05:6102:440e:b0:4c5:4591:ffda with SMTP id
 ada2fe7eead31-4ee4f78a70fmr1764599137.21.1751019350729; Fri, 27 Jun 2025
 03:15:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250627-exynosdrm-decon-v3-0-5b456f88cfea@disroot.org>
 <20250627-exynosdrm-decon-v3-1-5b456f88cfea@disroot.org> <CAAQKjZPAsE8LGE00fWE1aPj03b6tu1rk9ScTDSN+HeKzVXMZvw@mail.gmail.com>
 <20250627-garrulous-cuddly-flamingo-b4ebcf@krzk-bin>
In-Reply-To: <20250627-garrulous-cuddly-flamingo-b4ebcf@krzk-bin>
From: Inki Dae <daeinki@gmail.com>
Date: Fri, 27 Jun 2025 19:15:12 +0900
X-Gm-Features: Ac12FXzHboYrFxSlMZbUjKMAban_KcR6H0q7HqOUTH-xXDeKHhkBse3ecLJumpQ
Message-ID: <CAAQKjZO4grfoT=NYATNV5JojYgOyD=WwH4DgFTVcXEagXoFf8g@mail.gmail.com>
Subject: Re: [PATCH v3 1/3] dt-bindings: display: samsung,exynos7-decon: add
 properties for iommus and ports
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Kaustabh Chakraborty <kauschluss@disroot.org>, Seung-Woo Kim <sw0312.kim@samsung.com>, 
	Kyungmin Park <kyungmin.park@samsung.com>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Alim Akhtar <alim.akhtar@samsung.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>, Conor Dooley <conor@kernel.org>, 
	Ajay Kumar <ajaykumar.rs@samsung.com>, Akshu Agrawal <akshua@gmail.com>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

2025=EB=85=84 6=EC=9B=94 27=EC=9D=BC (=EA=B8=88) =EC=98=A4=ED=9B=84 4:51, K=
rzysztof Kozlowski <krzk@kernel.org>=EB=8B=98=EC=9D=B4 =EC=9E=91=EC=84=B1:
>
> On Fri, Jun 27, 2025 at 02:02:37PM +0900, Inki Dae wrote:
> > 2025=EB=85=84 6=EC=9B=94 27=EC=9D=BC (=EA=B8=88) =EC=98=A4=EC=A0=84 4:2=
1, Kaustabh Chakraborty <kauschluss@disroot.org>=EB=8B=98=EC=9D=B4 =EC=9E=
=91=EC=84=B1:
> > >
> > > Similar to FIMD and Exynos5433's DECON, the Exynos7 DECON hardware:
> > > - May optionally require an IOMMU to initialize a display region.
> > > - May require a port connection to another block, say an MIC or a DSI
> > >   master.
> > >
> > > Document these bindings in the devicetree schema.
> >
> > Applied.
>
> Please wait for DT review, giving us few hours is not enough. Please
> drop the patchset, needs fixes.

Got it. Reverted.

Thanks,
Inki Dae

>
> Best regards,
> Krzysztof
>
