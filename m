Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0422917A2F0;
	Sat, 26 Apr 2025 06:12:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745647947; cv=none; b=nfVBEQbkSQQaMs62SXsj27ARtlYUnOUr+ipjm7jy4Hpl6rqMGNgMA+TfIhgJ81QTZeSrKzAbgD/SIgaZNgNDzGvTUVxs1FODNZLltvFqOkptcYNk8ILNfJbvKZVYh8kGcVd1pEcCEWusvPfgCl02k43gbplQg9JUtgDKUWql29U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745647947; c=relaxed/simple;
	bh=ts30wuJotCKDAn6BcjJG1rAqDNg2V4mpYNEPUKSJRyE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cQx3F1Zj3NP525Gcn8hW8sYl/b00nzf6pp3eIO05hmz3CB/dCwd1Vaz5bS0EtNHZ/nZIeO92uMMLoe0PHwm/vl8lo882WoP0c5RC63B9djNjJLlv6ZKqOVxPG/kXTMnjukyWQuWuscypfyJy26QeEzPHZCORutTk5fZNDRDSL9w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gG8pKYDb; arc=none smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gG8pKYDb"
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-aaecf50578eso455127066b.2;
        Fri, 25 Apr 2025 23:12:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745647944; x=1746252744; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Q7AoqGRPCyCnlnI8KOQDam44EVXCyf/N7POplk+Weq8=;
        b=gG8pKYDbyBSeewT/KB2sxg+hZXlSefcaxceQAG3onXsBdWe8hmOSOnzels47+ElYmw
         8Lg8BP3/t09H+KCnORV5xJB5+RH1e+ATb6AyNc0LG5o8rhItG+tCJRSwgA4Ifo2unyE4
         OX9FVg2sGDqt88vhKoCW/38Sb1oivSgfw4rHH47EqyIDeBQ96rUGltlmwogUFbRsLp5J
         dMRT9eHHfFKz/9uNoUers4zlDgieAMlZ6Vcr8NRzdhyTSBNnBztZjJOgYOpDpkgzSfkX
         foXm/aVhwtINwTX8rVrXkNHVKHWaf3JlkBWFcQbW3FayoFDFsDioS29fTHD4MEJ//IvV
         mDfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745647944; x=1746252744;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Q7AoqGRPCyCnlnI8KOQDam44EVXCyf/N7POplk+Weq8=;
        b=kCiFPjcm4jsIq7vd4N2mXDSGX0N0FzDbUzzWuExz/t/FvdLPUpKkK9Fe8EJHZZxcv9
         zQSRXhe7GFwPUEz2Dv4uDua9HRyoHGIW50q5DAvdjlzOl1g28kDRJR6/BicH2LeDLpF4
         JWwtjv6ef5PvDzPYH410g/6L8ovckpOnMJG09/ZW3WKnQGUyD4ircz4jSuYpEJHhW4xR
         VQTzYU1eCXI1mWb2MXeJvV5s3ck+asJ855/iQAZ8lfR25RVZpvQkXrMOMKNwbYxOtThw
         sv69WlcD5Su/bWTx+vFA4i6FGojX6xlCO2axdt7fqWXPmAOWhjUMmzqiXh9DUDJCYcvX
         qCqw==
X-Forwarded-Encrypted: i=1; AJvYcCUBE+p/rrLCU8xzVCEWO2LcvwjRNRR8/KXZU10WFdLwQSJDDRg3gE7roa6+nPwXHzXrrnTvU5v0O3J6nxUkG3ODu/s=@vger.kernel.org, AJvYcCUlRCsBwKF4ZOW8DjarT60tIErrM04M5n9wFuQeuFmt+hDqhChq78e2Vek9MxhrI4XdKIZyEI2uDyBrmmIC@vger.kernel.org, AJvYcCWxE47RDsXVApvjQh29oyPdOppZXVtAx/CZfpzydcZw/nxf5DS/Nw4crM2hmCCCGGOKsrKx5ddg9Olh@vger.kernel.org, AJvYcCWxuRFvxhgaQoR8RWWm14zz4Kc97VBDNdGC4rBMh2yZlUO9mJVg2Yq9Nh+WZqFPpAYvJAmdgp67wDXf@vger.kernel.org
X-Gm-Message-State: AOJu0Yz03sIQoE/ft4Qak1jgpvZC09Evv8WoK4fP4kYWTA4Xj7JfFP3t
	z5lq+QCLFCaxjrLCUp+emMbcdFbzkyhUgGJEEMQI+lF8pBaUNoRn8tV0rntCy2a4EwEGZyLNLvs
	CCXm7qLqoswFqDrqtdrID7rG75+oXNA==
X-Gm-Gg: ASbGncvoG6KEzNrb3E9q7LbN6YLHC0KjVgud5PyXqkLq/gPB8TJZ15iMTa6mVum73yf
	bvbqdurOCu/R+mf84eRjrGJ44fNpjTe4ExsB51HmlHbOjX602TH9eS0abSWb3qaJ9TO3rbbYIYN
	N8FIz7pXbr0BZDT6RthYI0
X-Google-Smtp-Source: AGHT+IHhIwe8rU9PLpYBn4D0l6l1OxCmDLFLe9Bgm3lFBWXmThOd0XpQJqAtk/OcOVWwsd3kI1THgvNLEgb0DKDyTec=
X-Received: by 2002:a17:906:9f88:b0:acb:b08c:76ae with SMTP id
 a640c23a62f3a-ace710951d1mr418780966b.16.1745647943830; Fri, 25 Apr 2025
 23:12:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250425132727.5160-1-linux.amoon@gmail.com> <20250425132727.5160-9-linux.amoon@gmail.com>
 <7a1e2432-46e2-40f6-84af-bff45ab79899@kernel.org>
In-Reply-To: <7a1e2432-46e2-40f6-84af-bff45ab79899@kernel.org>
From: Anand Moon <linux.amoon@gmail.com>
Date: Sat, 26 Apr 2025 11:42:07 +0530
X-Gm-Features: ATxdqUE-aSBuAto3DWag_735XNh8AilQRfbJbLa3ov7b-DirWkNhYUiBgQia2w4
Message-ID: <CANAwSgSQrW8CCg7=rdN98EsoDZ0KsWv84DKOh3K4Jgmgz66XFQ@mail.gmail.com>
Subject: Re: [PATCH v1 08/10] ARM: dts: exynos: Add proper regulator states
 for suspend-to-mem for Exyno5250 smdk5250
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Chanwoo Choi <cw00.choi@samsung.com>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Alim Akhtar <alim.akhtar@samsung.com>, 
	"open list:MAXIM PMIC AND MUIC DRIVERS FOR EXYNOS BASED BO..." <linux-kernel@vger.kernel.org>, 
	"open list:COMMON CLK FRAMEWORK" <linux-clk@vger.kernel.org>, 
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, 
	"moderated list:ARM/SAMSUNG S3C, S5P AND EXYNOS ARM ARCHITECTURES" <linux-arm-kernel@lists.infradead.org>, 
	"open list:ARM/SAMSUNG S3C, S5P AND EXYNOS ARM ARCHITECTURES" <linux-samsung-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

Hi Krzysztof,

On Fri, 25 Apr 2025 at 20:18, Krzysztof Kozlowski <krzk@kernel.org> wrote:
>
> On 25/04/2025 15:26, Anand Moon wrote:
> > The MAX77686 PMCI is able to power down and up key core supplies and other
> > voltage rails via PWRREQ signal to enter / exit (deep) sleep mode.
> > PWRREQ status is ignored during initial power up and down processes.
> > All programming must be done before the AP enterns the sleep mode by
> > pulling PWRREQ low since the AP does not have programming capability
> > in (deep) sleep mode.
> >
> > Add suspend-to-mem node to regulator core to be enabled or disabled
> > during system suspend and also support changing the regulator operating
> > mode during runtime and when the system enter sleep mode (stand by mode).
> >
> > Regulators which can be turned off during system suspend:
> >       -LDOn   :       2, 6-8, 10-12, 14-16,
> >         -BUCKn  :       1-4.
> > Use standard regulator bindings for it ('regulator-off-in-suspend').
>
> I do not believe you tested this but instead send whatever you found
> somewhere without actually understanding the code. In the past you were
> sending such patches - without knowing what they do and without actually
> testing.
>
> NAK
>
Thanks for your review comments,

All the MAX77686 control register supports On/Off Control by PWRREQ signal.

Once the Application Processor (AP) boots up, the AP is able to power
down and up key
core supplies and other voltage rails via PWRREQ signal to enter /
exit (deep) sleep mode.
PWRREQ status is ignored during initial power up and down processes.
All programming must be done before the AP enterns the sleep mode by
pulling PWRREQ l
ow since the AP does not have programming capability in (deep) sleep mode.

So PWRREQ has the following states for control registers

00: OFF (regardless of PWRREQ)
01: Output ON/OFF controlled by PWRREQ PWRREQ=H (1) : Output ON
PWRREQ=L (0) : Output OFF
10: unused
11: ON (Regardless of PWRREQ)

I have dome code mapping through the driver to understand this feature.
If there is some code improvement plz suggest so.

> Best regards,
> Krzysztof

Thanks
-Anand
