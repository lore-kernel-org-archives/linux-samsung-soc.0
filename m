Received: from mail-oo1-f53.google.com (mail-oo1-f53.google.com [209.85.161.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33DC214A4C3
	for <linux-samsung-soc@vger.kernel.org>; Thu, 25 Apr 2024 16:49:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714063768; cv=none; b=pwbBAToG/As9NuZNNNgaNzpsAnHUfSA0gT4duii5u1txKsX8p7nEvr1zi28TSIgCX/Bc1I3dSipwuW3v9gUmMaXy381N5339MrhK+aNVbsvGyoBC8q+wxGmvITEesYI9+QJGoy0Xex0LR8Y5/FFl17zwJ5ncS2+kqOAyAfhH2+8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714063768; c=relaxed/simple;
	bh=MKvfwVZ3VjEw+spXFJ1a2UjO6QfAGuRev73DVWZbaUM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=I7xGmvqG/77MYuYL5y7GizLIu57JhrutrUI4UUgr0Uky7EDsEZ0aRoTAD9UhHEwIDMXcS3mB2+MIMwou2bo+07tUT3tLpC/4RGuL0iJSw2pxYWpvPn+7P3rmhYhASGhNn5Cpr2+WvryxIha5TyMXakNcF3y95XegRCUF2lN5Yu0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=vwaP65CK; arc=none smtp.client-ip=209.85.161.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="vwaP65CK"
Received: by mail-oo1-f53.google.com with SMTP id 006d021491bc7-5aa4204bacdso674173eaf.2
        for <linux-samsung-soc@vger.kernel.org>; Thu, 25 Apr 2024 09:49:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1714063765; x=1714668565; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=5ukGEv4eef9O4oU5FT2ArMRccMeqiVjOsIZWttkttWM=;
        b=vwaP65CKWUR3Hgjrge/MD9U3FiR0QCLRSgkkd6qnbHpKwaqwezALAMIrPNLr4PO6Th
         2UuTdThPNxET3UfZsx3QG0bleJjXqL45JtT0a4C8LsomG1e/UGuU6tTEbIjxWXlmO4fc
         eKq40JXudTgJNVjUX8AY24dKyzSIQEw1I0Gevxx+oCAojID+5Gwi2hriLKsbX1mt1881
         x75IB2RaRGMiNbyjK4p8FLdgZB+Sr4Uco0EafENGEjJahSFGQjL8KdgBTCno5uCfmm8z
         lTteC30TYtJggxSSy6Iep4KPkoQKjdR62UhCogPpFW6zZA5MgHlIPX+oyK1lQG8y6hE/
         Q2vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714063765; x=1714668565;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5ukGEv4eef9O4oU5FT2ArMRccMeqiVjOsIZWttkttWM=;
        b=j6hjG80JWBR5hO1wDhKo5d4IeMgiUY6Pi0N7gyW/SkU4nuW5nJ1JD4wfbGUVrtLPHV
         CW7woEGBJLINzrLI8rv73A/97HT4wGnksQWTlfAbQFtArGMzmR/lWTcYUSxs2VNScvfB
         OHubXw8o+3LudHv23eBnWtTbJip+COUphDYp+Z9cXBgIiKErm9x2tkAVk9va1hnYht68
         /YkNGrtNWGaj5HeUS2T5sTXv67R7Wiyt/BYjHu5banb9S9pTb2mqBNezO7KmNGD9L1Vi
         ApHfJjQGJO5sfT/Q1RfuaAgDOAb76IFPuFOK5b+8uR8tq8YipoROpXnNqk9QmMsITydx
         Y6Cg==
X-Forwarded-Encrypted: i=1; AJvYcCU+MaiUNcuZnJ8j66cX734onFIEh5rJMyujGT4JQaIEGS6K2eU66nbKaBHj/E20GsO+5Qfg2W/2JX+U+33Su9b3+kgUGub8zTeROxA5rcr0hLU=
X-Gm-Message-State: AOJu0YzwKMYtGX/dISwsl9Jw2ENV9rqbuD1XZod/MupkBU9+4Muvs5P+
	+iq5dBXVz2+imXxE8Ip1RsESlBsRCgfImKRJcRhyhmhibFUt6qgYXa6e8MVbAW91hHIQu0eGE6K
	sPKIcNkx9x4hKbdsXOBSVbuhadLjP+To8+TjwmA==
X-Google-Smtp-Source: AGHT+IHZ1YGe8mBmpi+s6MNal/Tnn6pc3qt4P8KtR6rNBxE+ojMFISn6UD+3xJRSRmAITd10pNraylhnueFfb1V3Mzo=
X-Received: by 2002:a05:6870:4201:b0:22e:e26e:73ad with SMTP id
 u1-20020a056870420100b0022ee26e73admr6867939oac.58.1714063765265; Thu, 25 Apr
 2024 09:49:25 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240423205006.1785138-1-peter.griffin@linaro.org>
 <20240423205006.1785138-4-peter.griffin@linaro.org> <20240424195318.GA367166-robh@kernel.org>
In-Reply-To: <20240424195318.GA367166-robh@kernel.org>
From: Peter Griffin <peter.griffin@linaro.org>
Date: Thu, 25 Apr 2024 17:49:11 +0100
Message-ID: <CADrjBPpQE2bMkVUHQHmBBZfRO8Hjb86xPvLQgSvn4BN0guY9xQ@mail.gmail.com>
Subject: Re: [PATCH v2 03/14] dt-bindings: ufs: exynos-ufs: Add gs101 compatible
To: Rob Herring <robh@kernel.org>
Cc: mturquette@baylibre.com, sboyd@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, vkoul@kernel.org, kishon@kernel.org, 
	alim.akhtar@samsung.com, avri.altman@wdc.com, bvanassche@acm.org, 
	s.nawrocki@samsung.com, cw00.choi@samsung.com, jejb@linux.ibm.com, 
	martin.petersen@oracle.com, James.Bottomley@hansenpartnership.com, 
	ebiggers@kernel.org, linux-scsi@vger.kernel.org, 
	linux-phy@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	tudor.ambarus@linaro.org, andre.draszik@linaro.org, saravanak@google.com, 
	willmcvicker@google.com
Content-Type: text/plain; charset="UTF-8"

Hi Rob,

Thanks for the review.

On Wed, 24 Apr 2024 at 20:53, Rob Herring <robh@kernel.org> wrote:
>
> On Tue, Apr 23, 2024 at 09:49:55PM +0100, Peter Griffin wrote:
> > Add dedicated google,gs101-ufs compatible for Google Tensor gs101
> > SoC.
> >
> > Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
> > ---
> >  .../bindings/ufs/samsung,exynos-ufs.yaml      | 38 +++++++++++++++++--
> >  1 file changed, 35 insertions(+), 3 deletions(-)
> >
> > diff --git a/Documentation/devicetree/bindings/ufs/samsung,exynos-ufs.yaml b/Documentation/devicetree/bindings/ufs/samsung,exynos-ufs.yaml
> > index b2b509b3944d..1179527d29d1 100644
> > --- a/Documentation/devicetree/bindings/ufs/samsung,exynos-ufs.yaml
> > +++ b/Documentation/devicetree/bindings/ufs/samsung,exynos-ufs.yaml
> > @@ -12,12 +12,10 @@ maintainers:
> >  description: |
> >    Each Samsung UFS host controller instance should have its own node.
> >
> > -allOf:
> > -  - $ref: ufs-common.yaml
> > -
> >  properties:
> >    compatible:
> >      enum:
> > +      - google,gs101-ufs
> >        - samsung,exynos7-ufs
> >        - samsung,exynosautov9-ufs
> >        - samsung,exynosautov9-ufs-vh
> > @@ -38,14 +36,24 @@ properties:
> >        - const: ufsp
> >
> >    clocks:
> > +    minItems: 2
> >      items:
> >        - description: ufs link core clock
> >        - description: unipro main clock
> > +      - description: fmp clock
> > +      - description: ufs aclk clock
> > +      - description: ufs pclk clock
> > +      - description: sysreg clock
> >
> >    clock-names:
> > +    minItems: 2
> >      items:
> >        - const: core_clk
> >        - const: sclk_unipro_main
> > +      - const: fmp
> > +      - const: ufs_aclk
> > +      - const: ufs_pclk
>
> 'ufs_' is redundant.

Will fix.

Thanks,

Peter.
