Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEE1F35E949
	for <linux-samsung-soc@vger.kernel.org>; Thu,  5 Mar 2026 10:01:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772704869; cv=none; b=lwm0S+miftZk2fmx0dRTnsAaHvoMtaBIduGq/ffXkPJSbJPNoMuaGp3NK7pEY905gKxPZdJNbU2H6CQdfgFZkYMGKPRDVOK681eLovZ7htwqkY0e6K5F8HTAFHisYHDvRJcIZe4xeA67KSTeRFWVoo5W6prrQ/Y39H44ojLGs8o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772704869; c=relaxed/simple;
	bh=508+zCdHt9MWfUxEq50brZahkkEiVxDT5BqlILcd3+w=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=IvMknXOlYxgKgeaBiHUxQhGm6yLRxCNC+u/fvys7tUKGBAfrDaXa+FMBButFnNq0B76gZjqG2IE3axOosDJkYMpPU68E/d5brztO84uFJPKHXsEUqzSA+qmAe99WUBP/hXPaNVd6O5o3EohkPzJQiG5H8Z4/B0oL6dmWYWhv8iY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2ad617d5b80so51152965ad.1
        for <linux-samsung-soc@vger.kernel.org>; Thu, 05 Mar 2026 02:01:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772704868; x=1773309668;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Cg9EXYcydfZ+ulIjzuaopPgTp0XFzaHPOEgk/rgt7WQ=;
        b=Bs/j8RAw6BnJtN32u7Ms5G+FLzZzMC/t0yEtN9SPbfiTCuLEvoiPtQWXCcWof9mHWd
         3QqMUk3uW6TGmnYLaVn9FLlTCN3050ETEB6LBe1b6P+8yBctdEuwTihW3+LhrTfhLDOv
         gl6bKNiqHPRKS1bzmQgD3stMyT8E0TxJrupvnaznSdvs+I5ibtBYcSL5gU/4RhPNBzzp
         LjpR/Lfwu/LCx1QPSXE04r8BUhfaNlLHp7nLMW1xcYD6NB/B0vq2LKLd2Efx49zhg/lY
         JSsWrVb/9Vhmb51QraTa7URois8kq4urGhU+MfzLU3ji4s/MeYn+/qNKMXdzJfHYfVE4
         mZIQ==
X-Forwarded-Encrypted: i=1; AJvYcCXNGNIaErscSfVQW8uaaG3XJL25er+JVFsdrxDmUzSKrMlP0sUwDFP6ZJ2ftmyl3pw2d99HenA/Kj+rF2kTqhw0Yg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwW/fKJBqA4Bp9N0ynfCdnWZUtaI5dP9cGgrKKlkRP5NjfkHZBI
	+Jx5E18DRryl/5r9h2tQ7J7nGCkCJ++YvbuKwVhUMaYLahKiIW18rnRleaypE3Dm
X-Gm-Gg: ATEYQzyny6WM2t3XTPvQBnp54ljygeidKPWIbm0O5gKnqxYqRVwRwZvSCcep/6sAQsN
	gqFPbtEBcW02QholvsTn8lQVi3qm/KaN3XPtbasuViMOsk62gYit8JAxUve0CX4fKCENHpsZUSD
	HwfcY3SnolEDVjYRHBKtaW5n6P39d8JT/I3q8H+xVp0rukP/KIijB7VPACHhJOveKAn34OAEcqk
	51gDv5m988tdqOf+xLLPjKE9jPbyE/NPXjzqpG5wJoudf86oJoPzy2I9qoO2VUVpCCjwL+4vU6z
	8EdF/tigCOOv4uiLDcPsdEhvf48eiud9434h0lmuXOQELk05asHBCAPz24RhVjaT1GMQMzc6HO+
	6LC0T95OydavOntnRDfOMtBZhN3kDVYS9z6+iQOPA03ABsQ2p4lnLjNL5b8h7dSTF/9wCl1jCnj
	CTkYr/WlavYeuH/AxXG7x2J/VAEbOGQBwfiivUC4ryn8MMWKGCyW6tCSmgZ6Y=
X-Received: by 2002:a17:902:cf03:b0:2ae:4d93:ba36 with SMTP id d9443c01a7336-2ae6a9de465mr59402365ad.11.1772704868168;
        Thu, 05 Mar 2026 02:01:08 -0800 (PST)
Received: from mail-dl1-f52.google.com (mail-dl1-f52.google.com. [74.125.82.52])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ae4e571b90sm117878065ad.62.2026.03.05.02.01.07
        for <linux-samsung-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Mar 2026 02:01:07 -0800 (PST)
Received: by mail-dl1-f52.google.com with SMTP id a92af1059eb24-12732e6a123so2536042c88.1
        for <linux-samsung-soc@vger.kernel.org>; Thu, 05 Mar 2026 02:01:07 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWftnh2Sojy4FdhJxy66ZpdPbi0atOVIG7eiPcX8wYESE4Cmzv/tgOYoTDiQM8eFw6QJl83CxmlTy5OBzx6vglFSA==@vger.kernel.org
X-Received: by 2002:a05:6102:26d6:b0:5fe:c4aa:10d6 with SMTP id
 ada2fe7eead31-5ffaaf7c9f3mr2333684137.34.1772704554695; Thu, 05 Mar 2026
 01:55:54 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1772643434.git.geert+renesas@glider.be> <ee2980af-e37c-4b4d-86c2-32467d2af454@oss.qualcomm.com>
In-Reply-To: <ee2980af-e37c-4b4d-86c2-32467d2af454@oss.qualcomm.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 5 Mar 2026 10:55:43 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUCqozRx_WJesymXmP_PYo4Bf=oed=4fXycVOVk5g8D4Q@mail.gmail.com>
X-Gm-Features: AaiRm50TZMfTdXxkme8-hNv5QLySSNWDLayLbCjX-hPHmdjBiItNwF_qP7aR9JM
Message-ID: <CAMuHMdUCqozRx_WJesymXmP_PYo4Bf=oed=4fXycVOVk5g8D4Q@mail.gmail.com>
Subject: Re: [PATCH 0/7] arm64: dts: Drop CPU masks from GICv3 PPI interrupts
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Marc Zyngier <maz@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
	Peter Griffin <peter.griffin@linaro.org>, =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
	Tudor Ambarus <tudor.ambarus@linaro.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
	Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	Dinh Nguyen <dinguyen@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Thierry Reding <treding@nvidia.com>, 
	linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-msm@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Konrad,

On Thu, 5 Mar 2026 at 10:33, Konrad Dybcio
<konrad.dybcio@oss.qualcomm.com> wrote:
> On 3/4/26 6:10 PM, Geert Uytterhoeven wrote:
> > Unlike older GIC variants, the GICv3 DT bindings do not support
> > specifying a CPU mask in PPI interrupt specifiers.  Hence this patch
> > series drop all such masks where they are still present.
>
> I'm having trouble finding where that's used on pre-v3 even.. does
> that actually get processed on the older iterations?

I had noticed the same, and had asked maz on IRC.
His answer:

   "so far, we have never seen a GICv{1,2} system that didn't have all
of its PPIs
    connected to the same set of devices."

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
