Received: from mail-vs1-f49.google.com (mail-vs1-f49.google.com [209.85.217.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C883237BE9F
	for <linux-samsung-soc@vger.kernel.org>; Thu, 29 Jan 2026 08:32:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769675576; cv=none; b=RJVi2JzjiZ4Y5Wr+vYxylz9UfqweJaKafN4sFaxiCQLH296viRFmSs0jLghR7KdOtSjY3cpZFzBf4NZZxsjV0GD8OPTAu3qRnJLaymXJ5/3+nx3dCXa8J4A5V5OOUnmoOLDiM3ZC5buuDafhBGUBNZeNj7KnkHWSxMYEClyLh7M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769675576; c=relaxed/simple;
	bh=MOFX1PqCGn8QyFW2rZucUtXQa6pqWk8qi8TtHid8dwk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FUHi4lCUibrDLBxjZVVXV9QLWte0I+wc8uaOrX/9OC1IKnb+EFlufqOgGUcHzVrArEafgk5JCgTlSBs4u7t3f42xS+nZ9sY3UoGYlEOJ0Rtinz66ga3si3Mg0DSdVawBBySdDgAcFQADQS4Ty/ZYiZM5OToXold4wPNRmCtWUWw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f49.google.com with SMTP id ada2fe7eead31-5f5418c40daso1486715137.0
        for <linux-samsung-soc@vger.kernel.org>; Thu, 29 Jan 2026 00:32:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769675568; x=1770280368;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=iWSiH0vErBGaTqnZZjDiFHXh+s+0x/2ewRQpe7UFdYM=;
        b=wDIZupBOBJv/XYV4EV+moUj1GyOFo36onUirvEFVtq43CMHVhAH70pGaZJ5mnhSy4G
         6vxd6lERE7PNHIgruv3EpFdhm3SnCcsNzc4BsMjCNXYqJzuH2Daklly8BNaF3SQt9An6
         je7BdVYJKqB3MxY7xWCEVVhhxpnlMl9WK8fQt9JsWqmyWf74mzVG2J6yZXF7PjH4oqJX
         RFxBCnzohUbls0FCj7bG6xnnCfY7GLDCn1eHJuUVEzFY+3zISgYGerJFbUoDoacf9Gl6
         75WQ/XFAWjJjYZtsQVXbZY9ioqLNJ2vwg6TifaKutHHoGCQE+ovA3F9e8ch6hm/RNky/
         10BA==
X-Forwarded-Encrypted: i=1; AJvYcCXOg84t4CM+zgtH6B5j5HRER5Dy2d3J/Sj6eYGHJKStoTtlu6jzXRMUzCXaC5xaPMsFui26NL2f109LZ7nmo3Tcmw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwbqoIERMmt0pQg+VjtCJ5CD5fsXzEiSSqa4dUs0rEoIHVR3NcC
	BiavNqgNkUTPrUUkAFEGEfroj+zsPDRW+IuHRrYSXiqN0zmRBVehPUNdYbmhFN4N
X-Gm-Gg: AZuq6aKqfVx1VfnAaKBN6DXSMbXhtIO+xoTQ8tzca7TjmS3zh91M8XxtVjMwJRu9IZG
	K/X4+5MUKpmstcD4G6jCPuQJGZmPibopyG3GAa1gxv0OXanjPDl4k29kpNFxfbIuBddjZG601EH
	LhviQJqgNotLsorjH4nRQEnPR6rUt27kQ72rq9SBo5Fv0NAMg31jxg4XUpDhfU6OV7O9i9dFqTs
	IrVlkxrnO2cNW8FM0hoJIsFg3ACTGiE8uEQknir1USDHW9KaQN2y2G+yAC8qPLte4TGeAu8Fame
	os0+R9liPsM7S5ZU6nvcmy+OkLLcEUBi+JBlmlCenxj0Rv+H9n/jNZB91ZgNFi5BBkpmV58iAuP
	pV8qxOdHIzRZRnNbyELfkck2+xjN50xj701zCMYcNz2DwDrJjH9NXJc9OmXOJlEsFZNvIFrKYtX
	+blyOlitJxh9CAEGA/JHAs0LoWO8nRig7sUn9cuJD19WEuIOjjTVUzmvYIcs4=
X-Received: by 2002:a05:6102:3747:b0:5f1:5be2:114b with SMTP id ada2fe7eead31-5f8cdc7b02dmr722296137.20.1769675568346;
        Thu, 29 Jan 2026 00:32:48 -0800 (PST)
Received: from mail-vs1-f53.google.com (mail-vs1-f53.google.com. [209.85.217.53])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-948723a9746sm1055718241.1.2026.01.29.00.32.47
        for <linux-samsung-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 29 Jan 2026 00:32:47 -0800 (PST)
Received: by mail-vs1-f53.google.com with SMTP id ada2fe7eead31-5f5418c40daso1486696137.0
        for <linux-samsung-soc@vger.kernel.org>; Thu, 29 Jan 2026 00:32:47 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVDOBr3Ajf3dHxKuF1zTizPzZRLyFELU+xNieY9ctCf/MjJtrqhfnwiO9NwQRoOSbKlqUfGAXOchMQM3FlFqIJqRA==@vger.kernel.org
X-Received: by 2002:a05:6102:358a:b0:5f1:b59d:a824 with SMTP id
 ada2fe7eead31-5f8cdbcdd58mr660134137.10.1769675567174; Thu, 29 Jan 2026
 00:32:47 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <0caa3c449b0c3d64944da3f1003d9389bdc13f98.1769541083.git.geert+renesas@glider.be>
 <e955868c06547ac62d34d594d45dd07aa19e361b.camel@linaro.org>
In-Reply-To: <e955868c06547ac62d34d594d45dd07aa19e361b.camel@linaro.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 29 Jan 2026 09:32:35 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUWgrA9Z3d8pzRpuWJ=_P+JtQyUvOoT0eVpOp7Cikzj0A@mail.gmail.com>
X-Gm-Features: AZwV_QhDAZHfDa69lcwIjPEMriVTWX2j2mEpl3sREl4ukbpmMZGKeuh-Z80oSWU
Message-ID: <CAMuHMdUWgrA9Z3d8pzRpuWJ=_P+JtQyUvOoT0eVpOp7Cikzj0A@mail.gmail.com>
Subject: Re: [PATCH] phy: PHY_GOOGLE_USB should depend on ARCH_GOOGLE
To: =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>, Vinod Koul <vkoul@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Peter Griffin <peter.griffin@linaro.org>, 
	Tudor Ambarus <tudor.ambarus@linaro.org>, Naveen Kumar <mnkumar@google.com>, 
	Roy Luo <royluo@google.com>, Joy Chakraborty <joychakr@google.com>, Arnd Bergmann <arnd@arndb.de>, 
	linux-phy@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Andr=C3=A9,

On Wed, 28 Jan 2026 at 21:03, Andr=C3=A9 Draszik <andre.draszik@linaro.org>=
 wrote:
> On Tue, 2026-01-27 at 20:12 +0100, Geert Uytterhoeven wrote:
> > The Google Tensor SoC USB PHY is only present on Google Tensor G5
> > (Laguna) SoCs.  Hence add a dependency on ARCH_GOOGLE, to prevent askin=
g
> > the user about this driver when configuring a kernel without Google
> > Tensor SoC support.
> >
> > Fixes: cbce66669c82ee9a ("phy: Add Google Tensor SoC USB PHY driver")
> > Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> > ---
> > ARCH_GOOGLE is not yet upstream, but that doesn't hurt.
>
> I can see your point, and have no objection, but for context, Greg
> had asked to not add dependencies on a config option that might or
> might not get added in the future - ARCH_GOOGLE:

The exact name may indeed still be under discussion.  But we all know
there _will_ be a config option (unless the platform is abandoned before
upstreaming, and this driver will be removed again anyway ;-).

> Maybe an alternative would be to make it default=3Dn, and change that
> default once ARCH_GOOGLE gets added?

It already defaults to disabled, as "default=3Dn" is the default.

> > --- a/drivers/phy/Kconfig
> > +++ b/drivers/phy/Kconfig
> > @@ -49,6 +49,7 @@ config GENERIC_PHY_MIPI_DPHY
> >
> >  config PHY_GOOGLE_USB
> >       tristate "Google Tensor SoC USB PHY driver"
> > +     depends on ARCH_GOOGLE || COMPILE_TEST
> >       select GENERIC_PHY
> >       help
> >         Enable support for the USB PHY on Google Tensor SoCs, starting =
with

Gr{oetje,eeting}s,

                        Geert

--=20
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds
