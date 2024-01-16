Received: from mail-il1-f180.google.com (mail-il1-f180.google.com [209.85.166.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDAE21CD2C
	for <linux-samsung-soc@vger.kernel.org>; Tue, 16 Jan 2024 18:13:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705428815; cv=none; b=s903GREWpw5KX6dYtcwtM7APc0GJlOOqz0R1L+TsnZCtN55Sw7toYPUn/3Ed0wwkObAARr8f6j4R74tC8dg1hlUJLfL3kVGkfH9l4Xlp1G6+g+hOTo24OAhB2qYBj9FOtex/y8/vIQdhJlLHiglUe3sAUiIMcLs42RDsrxPFfKE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705428815; c=relaxed/simple;
	bh=VuJdDQsi3mmyRqeinzNAGN5yeAy5DGs8zpA7Gnrei2w=;
	h=Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Google-Smtp-Source:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:Message-ID:Subject:To:Cc:
	 Content-Type:Content-Transfer-Encoding; b=r2gUgtuEjTcrnkBOFeYqCoaOH5XmKbfnG3+RQLL70tTAphfFV49js0GBnYnsGHk5fELdLCsSYiEmiFL++3x3uK9FyMZhBGbXZAQRJ9QVEzGT62Y83MHKA33DdG7k4TXqdgKoDlWINuBkoKOED2T8nXjCl6AJYfRuxYTIpA/vBjg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=KN2kb8mB; arc=none smtp.client-ip=209.85.166.180
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="KN2kb8mB"
Received: by mail-il1-f180.google.com with SMTP id e9e14a558f8ab-3606ad581a5so47887755ab.1
        for <linux-samsung-soc@vger.kernel.org>; Tue, 16 Jan 2024 10:13:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1705428813; x=1706033613; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qjIZbfBCvKCg1WSRzAw5p1veNjGXMCanGfKSk9xh9uU=;
        b=KN2kb8mBtcScJ7fOGhTyOOYrUghJvGm49zenor5IQP5MDYAvZwb1fTTF5LGBqr1WLZ
         UtnESJZaHbdUjmIitRY4XS4BcTeZ7xbWXE+cmukEGSTPevcakCADSY9tx/EywqBT56JV
         ov+rbcAMMdmmT5pKrpstCoz7pkNOJq5AMu3sqnyWULTIK+6bYHHcUMo44wRS4SWLsJSz
         Xoejz5ngnkNO/mU6LY/c58O5o0E4ir9XNBRwGGQzDCUbkfZYuqhrdlNU8Qraypa7g4Ui
         NcuwF3cIvBMmfX88238gECs3O5OfRFvNsRLOfpNACI+QZad40somCo+Cbr0C6moC5i5c
         m2Zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705428813; x=1706033613;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qjIZbfBCvKCg1WSRzAw5p1veNjGXMCanGfKSk9xh9uU=;
        b=TtPDmsv/hG2FDXJjU+cispECw4ByrEjD6Z76nhkHoXhFAVvqorl6eQd2f7mtRc4ib6
         KJGVh+QukrMf3K/lhWSZBjnklu1bRQNJ+bXUESeSfImd/dGwcDFk+U+jZTnyd03Cfed+
         WQPGeFsoAm4kQJcDrk21GDOsYOLBz4hZ8YbLsZRSi6me+CiVbrk2FN75z8gNdQoxp5Rg
         LZzleqaEsn4D7z2/L+lrR6S2cc2YwM0f29bk8DXt2R5RUTIkuGrY8acv0SeXrHYCO3a8
         uZJAAD6jLsuuaPez6UP8DtIs7aUbxQxK8QWioSfLVwnqtHBbZXka+Fk9jjiqwUmHq3uK
         2R/g==
X-Gm-Message-State: AOJu0YyxgTJGpEvTd1AVQwqABYLsm6/UtPq0rQocjPm6KtKrv2rQvYLZ
	LDPQwmvn9Xdeyt6LAXyTzAeRQ2bhDxJ+H3LIkBmVwV3syYMBTA==
X-Google-Smtp-Source: AGHT+IHg5H35PYEEVlG5CAjQhp4Vgw+BUhaFLcX5a93zb87VvfJY7vry+G4Z8Xu/GiQMw/VBPGWw/29JhGAAebs2l4c=
X-Received: by 2002:a05:6e02:1248:b0:360:29f:b7a9 with SMTP id
 j8-20020a056e02124800b00360029fb7a9mr7406208ilq.3.1705428812938; Tue, 16 Jan
 2024 10:13:32 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240110102102.61587-1-tudor.ambarus@linaro.org> <20240110102102.61587-5-tudor.ambarus@linaro.org>
In-Reply-To: <20240110102102.61587-5-tudor.ambarus@linaro.org>
From: Sam Protsenko <semen.protsenko@linaro.org>
Date: Tue, 16 Jan 2024 12:13:21 -0600
Message-ID: <CAPLW+4kMO=PMZn5Vntik6YYe+DnpYi7TEegG4D-EdGq2_ERwbQ@mail.gmail.com>
Subject: Re: [PATCH 04/18] tty: serial: samsung: sort headers alphabetically
To: Tudor Ambarus <tudor.ambarus@linaro.org>
Cc: krzysztof.kozlowski@linaro.org, alim.akhtar@samsung.com, 
	gregkh@linuxfoundation.org, jirislaby@kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org, 
	andre.draszik@linaro.org, peter.griffin@linaro.org, kernel-team@android.com, 
	willmcvicker@google.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 10, 2024 at 4:21=E2=80=AFAM Tudor Ambarus <tudor.ambarus@linaro=
.org> wrote:
>
> Sorting headers alphabetically helps locating duplicates,
> and makes it easier to figure out where to insert new headers.
>
> Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
> ---

Reviewed-by: Sam Protsenko <semen.protsenko@linaro.org>

>  drivers/tty/serial/samsung_tty.c | 27 ++++++++++++++-------------
>  1 file changed, 14 insertions(+), 13 deletions(-)
>
> diff --git a/drivers/tty/serial/samsung_tty.c b/drivers/tty/serial/samsun=
g_tty.c
> index 74bc5151dad4..f37d6724bfe5 100644
> --- a/drivers/tty/serial/samsung_tty.c
> +++ b/drivers/tty/serial/samsung_tty.c
> @@ -21,26 +21,27 @@
>   * BJD, 04-Nov-2004
>   */
>
> -#include <linux/dmaengine.h>
> +#include <linux/console.h>
> +#include <linux/clk.h>
> +#include <linux/cpufreq.h>
> +#include <linux/delay.h>
>  #include <linux/dma-mapping.h>
> -#include <linux/slab.h>
> +#include <linux/dmaengine.h>
> +#include <linux/init.h>
> +#include <linux/io.h>
> +#include <linux/ioport.h>
>  #include <linux/math.h>
>  #include <linux/module.h>
> -#include <linux/ioport.h>
> -#include <linux/io.h>
> +#include <linux/of.h>
>  #include <linux/platform_device.h>
> -#include <linux/init.h>
> +#include <linux/serial.h>
> +#include <linux/serial_core.h>
> +#include <linux/serial_s3c.h>
> +#include <linux/slab.h>
>  #include <linux/sysrq.h>
> -#include <linux/console.h>
>  #include <linux/tty.h>
>  #include <linux/tty_flip.h>
> -#include <linux/serial_core.h>
> -#include <linux/serial.h>
> -#include <linux/serial_s3c.h>
> -#include <linux/delay.h>
> -#include <linux/clk.h>
> -#include <linux/cpufreq.h>
> -#include <linux/of.h>
> +
>  #include <asm/irq.h>
>
>  /* UART name and device definitions */
> --
> 2.43.0.472.g3155946c3a-goog
>
>
