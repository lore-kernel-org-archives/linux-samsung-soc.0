Received: from mail-oo1-f42.google.com (mail-oo1-f42.google.com [209.85.161.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB03B19F49E;
	Tue, 30 Jul 2024 13:20:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722345646; cv=none; b=K+nlKtfOzYRGWcSfwJ7tBzFqJU83LwwGL6+t03RsaOxAZrw0x/Qz1mmtMDI8v/b3IvPMgB1vz351/jCj+rrW9/4Sig3d65dsWE2EgUq8RtxUYcH8B+5pUCHVRs8v1vurvkPN7Zm6xb1X1nutUXrDATZFJV7TEXn7KQO7yNJe8xs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722345646; c=relaxed/simple;
	bh=7YHKVOjP/Z1K/T47wIq6wzUpO43GPmAqr90tsG8/ka8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NiKr1yp9FGEKXj9ksZhIIdVLlYC9V/94JeNw2svhKgMq3b7hTW7FX6eQixA28wflbyeKKvGJVI223Won+VjQkVL0ELP0qut44sfRy1TBL39Lz0U7vjkgvSHDxo8xOyb0ugEHTiballeqf7ZJSNL9ZoM19z0CjRjh7zYLrDbnk9M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AkpWXms0; arc=none smtp.client-ip=209.85.161.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AkpWXms0"
Received: by mail-oo1-f42.google.com with SMTP id 006d021491bc7-5d5bd1b79cfso2746923eaf.2;
        Tue, 30 Jul 2024 06:20:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1722345644; x=1722950444; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=NKT9AID6l51Sh/jmyI/WVIz5V2pk45kYF2J8tQNV23A=;
        b=AkpWXms05zACtFvNUrm0ssvMH2Epizun2aM5Y3hZqLmFXuvA6uLOl/AGdIbbCwky3h
         ry09wu9Xwa3/bYLCTLmpSoAamhqzlwGPovOTljvGUMebbrZvGaUiqa/tVU2X3QeGbxW7
         xV0m5DSyOjBeUhD3LEKaNcqoZ4+H3svh2T5VF+pSjOaaE+CJ8RmcBLjgtZvTCWXdazIU
         eWF2S8hdhILz5+Rp4dLCEJsLt1b137Sgfe9IAHebDMX9TgfjAv19htTziBhhOTjekwiW
         zd6oQmGkkbbHco6VPj9LSiSW2s0+Ow8XXSCb38IieA6iZ3g4u/W/BoPF5gtPJsROHEWP
         +Znw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722345644; x=1722950444;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NKT9AID6l51Sh/jmyI/WVIz5V2pk45kYF2J8tQNV23A=;
        b=VK3oexRwh4ngMMdfmGs3gbNYMh2YYTc7LM265Rj7ioXiX3fona7lDKvApQkH0IZ5vF
         G6mHJZkxCx6yucSf2UydBx8MNgWWhhqJ+TuzpmLGA8RT1rVi6bKxcfCPbruATpkLmHc0
         RTSn7P1BkRfRZMXYNgsAthZ6g8mDwr02VOKrQzwv8DJz3eR+LqFpTVJJ6mvYnsNjEwBA
         huSHlYxjCRbz6WqBO7ovpYuqAeGFtozUFU9UcOE+Ay4hI0ti3v/rJ4JllNg0HR/XUDEb
         blRUb6ijVdErP6JEje5FmWfs3o6MeahM6RLdkMBj3lHlLrRZP73qFPEfmsc7wuAICe0f
         yfmA==
X-Forwarded-Encrypted: i=1; AJvYcCW064RIVyqqYbctYbcb7S/LUDevJC2916S4wg0P+ylFjQ9mBLx1O6NKiPVAxIdSMq6MRJ0q8+SUAtw9RC7pPH+ueiIMcMywtDx9ETv8pMNe+ZpQizqXfQUeBKKUUgFC0/M6Bkr4tfIg5ePOf3FdeXM14XnqIPJlE0vbS1SefYGa6kBNE1UmwJY1ep4q
X-Gm-Message-State: AOJu0YzRn7bJNGiyJ9Pnr+guuTVPcOyHNH4kySph3PZhH3UqGrOxqOzS
	Kxm77fsTiankVOb/oGCnbUPrzQQX2DWJJuDJ94orDYGRCj4S5A+yjSyLvm/6YuZct326FJMzV41
	00duOuxOXJpn1cY2yyXi0CN79AFxxAtrC
X-Google-Smtp-Source: AGHT+IF61epFbQKBhsYcl9kBeuOFb6PPIETo3cXxQSv34FfmL3+uJSH86maWs6AsnTgGhnD74p6CHw3xRk24AflBK4Y=
X-Received: by 2002:a05:6820:1c8b:b0:5ce:e851:7356 with SMTP id
 006d021491bc7-5d5d0d8fc7dmr11677855eaf.1.1722345643985; Tue, 30 Jul 2024
 06:20:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240730091322.5741-1-linux.amoon@gmail.com> <CGME20240730091412eucas1p18feced3968a5f87dc8fe05f78d5c7659@eucas1p1.samsung.com>
 <20240730091322.5741-2-linux.amoon@gmail.com> <09e9cf0b-27fd-46b8-8631-87d798afd19e@samsung.com>
 <CANAwSgT_TOFwP80+H8-CdXDLLu+u2XZMr2dnxcsSDe8S5yeYCw@mail.gmail.com> <a41a6143-ef2e-4d86-b102-eaf442985173@kernel.org>
In-Reply-To: <a41a6143-ef2e-4d86-b102-eaf442985173@kernel.org>
From: Anand Moon <linux.amoon@gmail.com>
Date: Tue, 30 Jul 2024 18:50:27 +0530
Message-ID: <CANAwSgSbSgXwOQLrVrHD7jpDe0=Bq7r2K8p0JjvZJMPpVNq4XQ@mail.gmail.com>
Subject: Re: [PATCH v1 2/2] ARM: dts: samsung: Add cache information to the
 Exynos542x SoC
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Marek Szyprowski <m.szyprowski@samsung.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Alim Akhtar <alim.akhtar@samsung.com>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Krzysztof,

On Tue, 30 Jul 2024 at 17:57, Krzysztof Kozlowski <krzk@kernel.org> wrote:
>
> On 30/07/2024 14:06, Anand Moon wrote:
> > Hi Marek,
> >
> > On Tue, 30 Jul 2024 at 17:14, Marek Szyprowski <m.szyprowski@samsung.com> wrote:
> >>
> >>
> >> On 30.07.2024 11:13, Anand Moon wrote:
> >>> As per Exynos 5422 user manual add missing cache information to
> >>> the Exynos542x SoC.
> >>>
> >>> - Each Cortex-A7 core has 32 KB of instruction cache and
> >>>       32 KB of L1 data cache available.
> >>> - Each Cortex-A15 core has 32 KB of L1 instruction cache and
> >>>       32 KB of L1 data cache available.
> >>> - The little (A7) cluster has 512 KB of unified L2 cache available.
> >>> - The big (A15) cluster has 2 MB of unified L2 cache available.
> >>>
> >>> Features:
> >>> - Exynos 5422 support cache coherency interconnect (CCI) bus with
> >>>    L2 cache snooping capability. This hardware automatic L2 cache
> >>>    snooping removes the efforts of synchronizing the contents of the
> >>>    two L2 caches in core switching event.
> >>>
> >>> Signed-off-by: Anand Moon <linux.amoon@gmail.com>
> >>
> >>
> >> The provided values are not correct. Please refer to commit 5f41f9198f29
> >> ("ARM: 8864/1: Add workaround for I-Cache line size mismatch between CPU
> >> cores"), which adds workaround for different l1 icache line size between
> >> big and little CPUs. This workaround gets enabled on all Exynos542x/5800
> >> boards.
> >>
> > Ok, I have just referred to the Exynos 5422 user manual for this patch,
> > This patch is just updating the cache size for CPU for big.litle architecture..
> >
>
> Let me get it right. Marek's comment was that you used wrong values.
> Marek also provided rationale for this. Now your reply is that you
> update cache size? Sorry, I fail how you address Marek's comment.
>
> Do not repeat what the patch is doing. We all can see it. Instead
> respond to the comment with some sort of arguments.
>

Ok, If I am not wrong  icache_size is hard-coded in the above commit.

+#ifdef CONFIG_CPU_ICACHE_MISMATCH_WORKAROUND
+.globl icache_size
+       .data
+       .align  2
+icache_size:
+       .long   64
+       .text
+#endif

In the check_cpu_icache_size function, we read the control reg
and recalculate the icache_size.
if there mismatch we re-apply the Icache_size,

So dts passed values do not apply over here,

> Best regards,
> Krzysztof
>

Thanks
-Anand
