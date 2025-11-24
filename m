Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com [209.85.160.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 336632C0287
	for <linux-samsung-soc@vger.kernel.org>; Mon, 24 Nov 2025 17:42:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764006159; cv=none; b=bifEol1EW9sv34+QnSf0cunYGbBGfrMUsK6heaWNMRV+GUnJclY/CfCl05GN9ygfKKTR3DXpgwUryZUMZheCIPPiFeF0RvSHhppbCFYeE3jlYF1p+GHAWWvM5HghDaSCz0YDJx1KaU2pzm3InRdrP8lOul24iL+Oo1zJrVIRZuw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764006159; c=relaxed/simple;
	bh=f3RguNWyNPblPkEEAtjriyDmmiD8h8nq2mR8oBqONQc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=oUXMkB3EI+aiRl/ELQFQguUptWsdRGZreM1NFuhurAJBsRoQr2f4nIfDLi7aumN/bSYI56+jpEzc8r3mdQjSGzIU27Zr/DyMWG5rIsD1NviWxvbu2mGxbsE9bNZUHveYFvZNLDpzJV4Fo4E4pNmKc8Tk8QJ0HsWmwZFEYHB0csM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Wb1SiZ4c; arc=none smtp.client-ip=209.85.160.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Wb1SiZ4c"
Received: by mail-qt1-f173.google.com with SMTP id d75a77b69052e-4ee14ba3d9cso45806491cf.1
        for <linux-samsung-soc@vger.kernel.org>; Mon, 24 Nov 2025 09:42:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1764006155; x=1764610955; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=wJlK4WkEfRbWEw3zV/b5T4Bu/Nyg8DEPoH+DiAjRgFs=;
        b=Wb1SiZ4c2nIJGy/B9gOjHrGH6uPHmfHYtVr5B3KW57BeudBQ0nY6hzwi5Hqt+D1h7d
         KONMMD5EET4h600XwC522X1gOzkaWTqkKZ3RqxlKJR2rM9HgCbJKXZi0UsEJhhEFadSP
         MNYOReePYX4FVwx5ob5cGkWX+mLsYyy8i/NO133VnPDueb89MUDu5hMyjiSDpU6ytK6e
         kevg/X0wP4hgSQ1vBVo6zdMgZ0LVtkSBCYZOx8wXo39+Qm+U08dgpWcE0Dc1ENs62WZf
         nqHh0CxK7sInPOQLDv++CuXW98TK6E9vTAUiQW3vGYsOZVH0fE6sMmvw7m/nBnmSZBWN
         Rq8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764006155; x=1764610955;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wJlK4WkEfRbWEw3zV/b5T4Bu/Nyg8DEPoH+DiAjRgFs=;
        b=vx/DIUTIXVc7YgHP48rhOoKKsn1OMBsNVUX1T9iLM9/ytF/FMyUvuZ8yO3ixo++udR
         5PVTdmKMmhl7siyvkXXGzP3nVsItFP6Qdn6WEEl/+GBaFlczc5JSIspB5jdqkj0aqdaJ
         11vfQpVQNUOsT+esUrns/Ng3FnjgBmlDHnjDBOrj4+4DzBKD2tEff14r2gOR08O1128b
         AGS0udxeA6u7TpVhIEEyUqUBvy4pZWvgZOafeG9uJxi8sb9o6WSHGkhXfY1E2dIjm8vc
         euDFEvx4F7kWYyQ1wtVjtxNtsoezjWuiWSpA/8Abfp+vsV185QbELH97ubLTUVy3DUJr
         icrQ==
X-Forwarded-Encrypted: i=1; AJvYcCUe8TfEfducsGADqkW1dKqncdCeOFAR1qrrIJBcqt/cjzdlD93oHd6BtjsYtb+edYxBr5nHVz60Ye5z9dyKvmHr2g==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy3aNJQMjwb7VzfC8jipdFVix6e4QcPi/Nk/wtaprmYL0UtRZbX
	TOFti3gu+MJ/Nqv7IjPyFVoEa/alujeo9hCyN7CxOTNb2IREMRXKEAIvZmMAGxUOYUHb/vN/rOb
	J34UwjlpYX+/zmGh3SJ5ggh7s+AjNjkFlPd995Jv0EA==
X-Gm-Gg: ASbGncvKvKjoaoW3DiGeqMPoPxBQsrGGAhOfbNgeOX43vFFdvHDgjM0MdlNFienpn2t
	tbQlMHMgvkphg0VHbZ+H3jCDuDJ0wCUBHr+gjfMSiOCxaOJtS3g+8wPupAR2sa6melpapD56cHK
	UvizRAxFAoAjp/d95/wLi5w+78aBFxGgi2Zh238hjmpJ5JjhxGPSDFVHtXh3zgIoRKH9EhwqulE
	7S05fV7HY9q7Q7mrKnJ5ooiK0DJ4mRDfNDuRdglJf/rGf1sAxVpmJhebhYDqdaHevBIaDo=
X-Google-Smtp-Source: AGHT+IH68eFLCxGAwB70YXKDcrzscx1x/5nopbEjXq3rg0i05BtoHBXKwXgwKJ1Je/SGb0RGBvXAIWmKGfE/9kaXr84=
X-Received: by 2002:ac8:59c5:0:b0:4ee:24e8:c9a1 with SMTP id
 d75a77b69052e-4ee588908eamr163978631cf.44.1764006154636; Mon, 24 Nov 2025
 09:42:34 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CGME20251117073601epcas2p2c72bdd8689a69b35b988894653300c75@epcas2p2.samsung.com>
 <20251117074140.4090939-1-youngmin.nam@samsung.com>
In-Reply-To: <20251117074140.4090939-1-youngmin.nam@samsung.com>
From: Peter Griffin <peter.griffin@linaro.org>
Date: Mon, 24 Nov 2025 17:42:22 +0000
X-Gm-Features: AWmQ_bkIQmeVVQ1__i6Ji95mfG_JBQNHpbx1ya0fFzrMqWuIcxJaF_YHxRYrtX0
Message-ID: <CADrjBPrPpgy93At1bBanBoka14eyRbAArep5zuvbGWcOEnOuRQ@mail.gmail.com>
Subject: Re: [RFT PATCH v2 0/5] pinctrl: samsung: exynos9 cleanups and fixes
To: Youngmin Nam <youngmin.nam@samsung.com>
Cc: krzk@kernel.org, s.nawrocki@samsung.com, alim.akhtar@samsung.com, 
	linus.walleij@linaro.org, semen.protsenko@linaro.org, ryu.real@samsung.com, 
	d7271.choe@samsung.com, linux-arm-kernel@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Youngmin,

On Mon, 17 Nov 2025 at 07:36, Youngmin Nam <youngmin.nam@samsung.com> wrote:
>
> Several SoCs carried near-duplicate pin bank macro families, making
> tables verbose and hard to share when only the bank type (alive/off)
> differs.
>
> GS101 had its own helpers even though the newer EXYNOS9_* helpers cover
> the same semantics, including per-bank filter control (FLTCON) offsets.
>
> Some pin-bank tables didn't match the SoC TRMs (bank type, EINT class,
> or bank names), and FLTCON wasn't always at a contiguous offset from
> EINT.
>
> This series does
> - Consolidate on EXYNOS9_* pin-bank macros. Pass bank_type explicitly.
> - Fix table errors on Exynos2200/7885/8890/8895 per TRM.
> - Add explicit per-bank FLTCON offsets and update affected tables.
> - Drop GS101-specific macros in favor of EXYNOS9_*.
> - Rename gs101_pinctrl_{suspend,resume} ->
>   exynos9_pinctrl_{suspend,resume}.
>
> This series was based on the pinctrl/samsung tree [1].
>
> I tested on Exynos850 through boot and verified the pin values as
> follows:

One thing I just noticed is exynos850_pin_ctrl isn't actually setting
the .suspend and .resume callbacks so some of this code won't be
executed there (specifically saving/restoring the fltcon register). If
you're using e850 platform to test this series, you likely want to set

.suspend = exynos9_pinctrl_suspend,
.resume = exynos9_pinctrl_resume,

in exynos850_pin_ctrl for the alive bank

You can then #define DEBUG in drivers/pinctrl/samsung/pinctrl-exynos.c

Recompile, and do

echo platform > /sys/power/pm_test
echo mem > /sys/power/state

and you should see all the debug from the newly enabled exynos9
suspend/resume callbacks

[  871.104840][  T741] gph2: save     con 0x00000000
[  871.104932][  T741] gph2: save fltcon0 0x00000000
[  871.105022][  T741] gph2: save fltcon1 0x00000000
[  871.105109][  T741] gph2: save    mask 0x0000003f
<snip>

Prior to adding fltcon_offset and the gs101 (now exynos9) specific
suspend/resume callbacks this would generate a SError on gs101

Thanks,

Peter

>
> $:/sys/kernel/debug/pinctrl/139b0000.pinctrl-samsung-pinctrl# cat pins
> registered pins: 42
> pin 0 (gpg0-0) 0:gpg0 CON(0x0) DAT(0x0) PUD(0x1) DRV(0x2) CON_PDN(0x2) PUD_PDN(0x1)
> pin 1 (gpg0-1) 1:gpg0 CON(0x0) DAT(0x0) PUD(0x1) DRV(0x2) CON_PDN(0x2) PUD_PDN(0x1)
> ...
>
> Additional testing on the affected Exynos9-era platforms would be
> appreciated.
>
> [1] https://git.kernel.org/pub/scm/linux/kernel/git/pinctrl/samsung.git
>
> Changes in v2:
>   - Added base tree for this series (pinctrl/samsung).
>   - Renamed the macro parameter from 'types' to 'bank_type' for clarity
>     (struct member remains 'type').
>   - Reflowed commit messages (wrap at ~72 cols).
>   - Replaced non-ASCII characters with ASCII equivalents.
>   - Collected tags:
>       Reviewed-by: Sam Protsenko <semen.protsenko@linaro.org>
>       Tested-by: Sam Protsenko <semen.protsenko@linaro.org>
>   - Normalized hex literals to lowercase and removed double spaces.
>   - Aligned backslashes in macro definitions to form a vertical column
>     for readability.
>   - Added missing mailing lists (including linux-kernel) to Cc per
>     scripts/get_maintainer.pl.
>
> Youngmin Nam (5):
>   pinctrl: samsung: Consolidate pin-bank macros under EXYNOS9_* and pass
>     bank_type explicitly
>   pinctrl: samsung: fix incorrect pin-bank entries on
>     Exynos2200/7885/8890/8895
>   pinctrl: samsung: add per-bank FLTCON offset to EXYNOS9_PIN_BANK_* and
>     fix tables
>   pinctrl: samsung: fold GS101 pin-bank macros into EXYNOS9_*
>   pinctrl: samsung: rename gs101_pinctrl_* to exynos9_pinctrl_*
>
>  .../pinctrl/samsung/pinctrl-exynos-arm64.c    | 1069 ++++++++---------
>  drivers/pinctrl/samsung/pinctrl-exynos.c      |    4 +-
>  drivers/pinctrl/samsung/pinctrl-exynos.h      |   97 +-
>  drivers/pinctrl/samsung/pinctrl-samsung.h     |    4 +-
>  4 files changed, 562 insertions(+), 612 deletions(-)
>
> --
> 2.39.2
>
