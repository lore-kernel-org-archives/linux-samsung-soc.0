Received: from mail-ua1-f49.google.com (mail-ua1-f49.google.com [209.85.222.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2D7B3D0934
	for <linux-samsung-soc@vger.kernel.org>; Thu, 30 Jul 2026 23:33:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785454418; cv=none; b=KGg6B2H8vY3nZPUxfKCva4gW3K2wYHBc/2CKUjRui05tZw4vJ1nH0hrQVWZ6hAC4Hq4QdPn1APXfgIKcQKJtvY9983AD/5Vl9MJrG5B2YcMM9CtBbnzYSYJPEHhxQ1JsGatt2HONocLEDcQrlSOanVB5TaViTK2G9ryUQc++EAw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785454418; c=relaxed/simple;
	bh=GPZxIJ12NCdT32FLt89aeHS/XUCWgFohujxo0l4BvtQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Fcue/d8Slud/IBHfU7+3+O913mCEq9da5KLihoGxYWSxosQ/g5xNV/KFtPLKr9DU5EIZYcqF9MB19yk/iwv3UgcmdOze0zK+d5gYhPAElUg9tKizQJRskEKqOIq3w/PYHAcbeiZvDkSgwFXiIrWMmsMS2pskaOBFDD143Wbq2Zs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=ktCjQltn; arc=none smtp.client-ip=209.85.222.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="ktCjQltn"
Received: by mail-ua1-f49.google.com with SMTP id a1e0cc1a2514c-9673385b1efso91983241.2
        for <linux-samsung-soc@vger.kernel.org>; Thu, 30 Jul 2026 16:33:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1785454416; x=1786059216; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=1swx6ZS7vRHB6s/IgYx4mgkiMyCPAEEjNZGLF7mxwyE=;
        b=ktCjQltnEtWDxdD3PtmZwcOA6myvZk7w9Oq5rnyA4+xrjxaugP2UH4EZM9BnqKmI8E
         JHOxQgXyMTX1Ui4ZHj3si8tMSKNKJ4HWY5JwvN8JNzek9CTCPfa+5xcKzI+/LEJPCSU1
         71JplxZ3fEvproXIJw+hTaiy++bZGjKwOYxHs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785454416; x=1786059216;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1swx6ZS7vRHB6s/IgYx4mgkiMyCPAEEjNZGLF7mxwyE=;
        b=Lj/I46+CMVXLFZ900F1ec+y63BbQEfdp4mrphiHes26GzuKJUOxtzVFIC4LbhrvxnN
         ROAe3JIIF2ccpC/Rxc/pO1DWTmzN6aXH6G8MGUcoNwvFTUvRJlEl/VNfFaexRa0Th/dM
         IqL2Rub/40+uWSk97wDcmlWtavNWvN5vhqGGV6Mq1SXXiGqfcPbbfGg+cDrfrIKNnYo/
         rMDGKYSfnaYo9DqVkQnuFqXYRTIHChd6T/cpolPO/24eGtVJBtYUHelsCiqBaYEqhvQ2
         vdSi0mzjH2QApFt+kMwYZq99mCBr1Qde4Qezos3MImWTDY/TnhuiypMTEf8LbNPB9CxX
         l3VQ==
X-Forwarded-Encrypted: i=1; AHgh+Ro7vXwrWWC6Mhonl/KmLoyW/SHU3C2+a9bEELP8kBX1opl0LGfzcgEwhk3QQUGKL7REz4PDFdMd1XfLb2d6rCgfCQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzYsFuHLzYP5hQ60ZsAjyj/wQgA37zfJhH03M9UP/d4EA9HAAKm
	/JKlm+ygIE094Ept5wD2fuFSEPvgnjv2PCdyArt5wYTKCwZECmPNIOnS+WCL9vCnTZ2puM9oK0l
	iXTs=
X-Gm-Gg: AR+sD10K8qdZfO1HnFncxBg88xW0AmkTloNCipJSeIfvdsUeWj16u+2CHXmDZt6IB2g
	wzweSuUAgnTfF6Jyd/LytdSHP/SxWtKO2Ain+jvnc/8zhwj7xQ0CquUQmlgEX4yhbXHrc+Rr32a
	rPnM1qzHExB0r83uKvwDYxsqXIE23IZ38DGjMBs8bUeFA0bzEIJmMqxLCt7M5VmbRj3KSxYJkPV
	FW8ssiIDXJXO5QFVcAEAW6vE+/9nNBoDRzcK2hKej6DTlwDhTQwykV4VnnZni3L+zzxEGrcNGOn
	V9Hv7/+GBtLuHkYsv/MkWDmCueZBYc4cQB+RNoeCQdRJbmVXDkjoklpQvBvnYFI+k1YipyljySQ
	F7JD0FuGjjGe12SoiAUv08L1cEmc0NWmnuJVm250qeLFdy7OC9VX5vd0xro7jYdZJ9huCejL5X5
	IyxMP9KZpEQjA8JEgIywFRIrmBTs5GWFt0zEjxPd1oOKDwtej4YvVedora3p+Si8UDPm//wFNTD
	Px44qaLEDrprGqPkkmDdbafTpY=
X-Received: by 2002:a05:6102:3708:b0:6c2:e290:cc69 with SMTP id ada2fe7eead31-75750786c56mr1614011137.23.1785454415795;
        Thu, 30 Jul 2026 16:33:35 -0700 (PDT)
Received: from mail-ua1-f50.google.com (mail-ua1-f50.google.com. [209.85.222.50])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-7575bba4f9csm2219382137.10.2026.07.30.16.33.35
        for <linux-samsung-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Jul 2026 16:33:35 -0700 (PDT)
Received: by mail-ua1-f50.google.com with SMTP id a1e0cc1a2514c-977bbf2eb3aso75262241.0
        for <linux-samsung-soc@vger.kernel.org>; Thu, 30 Jul 2026 16:33:35 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RrhyNB3aV0JHQP9kZNlxvSNBUEzY+ecKCOO5EFbXkWv5nhlobqVQv+OrFAC0Wrq0KLUvokTEPo2Viw4az1X/PgJsg==@vger.kernel.org
X-Received: by 2002:a05:6102:3592:b0:608:9a34:c8ea with SMTP id
 ada2fe7eead31-7574e6d1a1amr1650546137.10.1785454414391; Thu, 30 Jul 2026
 16:33:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260722-contrib-pg-pixel10-initial-dts-v2-0-3abae9717feb@linaro.org>
 <20260722-contrib-pg-pixel10-initial-dts-v2-1-3abae9717feb@linaro.org>
In-Reply-To: <20260722-contrib-pg-pixel10-initial-dts-v2-1-3abae9717feb@linaro.org>
From: Doug Anderson <dianders@chromium.org>
Date: Thu, 30 Jul 2026 16:33:22 -0700
X-Gmail-Original-Message-ID: <CAD=FV=X32DiN2X26AutA97cpmywW9C3-76p-crT8sSQ+XqZNZw@mail.gmail.com>
X-Gm-Features: AUfX_mwLrAK1Nx-rPTyOqhPQSXAd6QqwkRvKOTa5fFmS8RMZbaeNFVMG8HEBq6M
Message-ID: <CAD=FV=X32DiN2X26AutA97cpmywW9C3-76p-crT8sSQ+XqZNZw@mail.gmail.com>
Subject: Re: [PATCH v2 1/5] dt-bindings: arm: google: Add dt bindings for frankel/blazer/mustang
To: Peter Griffin <peter.griffin@linaro.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
	Tudor Ambarus <tudor.ambarus@linaro.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Jiri Slaby <jirislaby@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Arnd Bergmann <arnd@arndb.de>, Krzysztof Kozlowski <krzk@kernel.org>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Linus Walleij <linusw@kernel.org>, 
	Drew Fustini <fustini@kernel.org>, Kees Cook <kees@kernel.org>, Tony Luck <tony.luck@intel.com>, 
	"Guilherme G. Piccoli" <gpiccoli@igalia.com>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org, linux-serial@vger.kernel.org, 
	soc@lists.linux.dev, Juan Yescas <jyescas@google.com>, RD Babiera <rdbabiera@google.com>, 
	Brian Norris <briannorris@google.com>, William McVicker <willmcvicker@google.com>, 
	kernel-team@android.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Wed, Jul 22, 2026 at 2:56=E2=80=AFAM Peter Griffin <peter.griffin@linaro=
.org> wrote:
>
> -  # Bootloader requires empty ect node to be present
> +      # Google Tensor G5 AKA lga (laguna) SoC and boards
> +      - description:
> +          Google Pixel 10, 10 Pro, 10 Pro XL (Frankel, Blazer,
> +          Mustang).
> +        items:
> +          - enum:
> +              - google,lga-blazer
> +              - google,lga-frankel
> +              - google,lga-mustang
> +          - const: google,lga

I'm not sure I really want to make a big stink here since I'm
certainly interested in getting something landed. That being said, I
at least want to ask about the "google,lga" entry in the above
snippet. "google,lga" represents the SoC and I don't think that's
technically required in the top-level compatible string.

I had a previous email about this that essentially went nowhere [1],
but I'm hoping to continue the discussion (along with other similar
topics) and Plumbers. The essence of the question is: how much data do
we really want to jam into the top-level compatible string, and is the
top-level compatible string truly the best place to indicate which SoC
is present in the system? While many boards put the SoC here, I don't
think anything in the DT spec requires it, and I'm hoping that we can
stop doing it for new boards. When/if we need the SoC info in the
device tree, it seems like we could put it somewhere better...

[1] https://lore.kernel.org/r/CAD=3DFV=3DW+jE_L_LLgAhD8K_4+CtivSD9-9t7Xe63X=
uKrKjfyfeQ@mail.gmail.com/
