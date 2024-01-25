Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7A7D1350ED
	for <linux-samsung-soc@vger.kernel.org>; Thu, 25 Jan 2024 20:38:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706215136; cv=none; b=PHjSj5trESVzUhCSxh8lbggoPRLHbHsJmqhTXDTWT4FtX8dd0ytmWxV+4/x7rjKd+roSgzVglRTx+mxPHBYSFEdUlCbK3JSsdog4Pky3P9PM6QfoL3c8Kl3Thajw28jwbgS00vPoQ9ydlqrq0USmM17x1I3OKQvgfEAF3x514oM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706215136; c=relaxed/simple;
	bh=as8BxR+QqTPluaUhYT7i9ae+BmGNNbMHHNTI1DbPeLg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=AS/J/FHeTBiASpMc5T0LzQaJBYOYO+0O5oFuRHGfbRMrGiUMsDFJY2DKvIpk9aYtaFhaEjkpre4zJjm5FqcxDtM9xnZQUqV8PpNLrvE9ahd3mJKkJvF3I9wD7hJOAiPMHua2iq4K3VyPCSoJ97qM8PXGE4XYw1ToforGXiSg5HQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Gthl0H1S; arc=none smtp.client-ip=209.85.215.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Gthl0H1S"
Received: by mail-pg1-f180.google.com with SMTP id 41be03b00d2f7-5d5ce6a0e5fso1298688a12.2
        for <linux-samsung-soc@vger.kernel.org>; Thu, 25 Jan 2024 12:38:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1706215133; x=1706819933; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YW4kVaU4qs4/wv4NEfs20us9zrffpc4IBOWQ2Q3fD5c=;
        b=Gthl0H1SL5pH6/nK+uMoSBbK7Y0m30Ms5oXRlQaFBe/TkPP4753hF0TuLxFWbXU3Fl
         oT3dmSw9L8+Hr617q6vK0IQncs8r11F9tAjpLA1dPW1+WSOpDYZyvXrOhWOR9INz+NlE
         x7q2ul6gS1CupMZbPcH5HAChrLpKlgwQhkqFHIJUPRsBeoCiiNZuETQ/91V2gEJQ9oUz
         HKvdbqerEU8EYANNV+ttk7UwNng9u5hUHvUvyKu8C7zXownQEWG6LPbYPU6wn8Ud0/dJ
         tLtDRRT0Rk2TQ65xIao4HcnrKcKI3OD/2JJcqhRMmSC/HFWMZY5qKOf1If2cnyGQI/wm
         EEyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706215133; x=1706819933;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YW4kVaU4qs4/wv4NEfs20us9zrffpc4IBOWQ2Q3fD5c=;
        b=aXd5b1bQVjF/30Bd4pDNd+0fHykESq1NfXwoUxAGhM/+FY+tR7YK07eC5cmv0BPjaA
         YbuybpBoWrRd/2Go2zzGlEAmqC+kTIgdObQi3pUeyhBV3BDLSiBEvGTKWRhGFJE7eknq
         /JvtL5Wy9L6fpnFNP83+mQ0qTRoHaupao/1lYcjRgmw3wT15H1bcsfevzm8BogHR/6AR
         bTt2eQ3HTKXBLq/D7x0+9V13cUCCbX6CRP3ienKnRybEKuu6N7QEwzqxuYKox0hrYIVi
         YNnBUNxmupFiiFYzd8bgWeViMYMjJUxYetD5lLEWVwz4Gqcr4WtKqSuwt1ewm4F+sDCn
         ICiA==
X-Gm-Message-State: AOJu0Yy1m8lMYhqSO5YKrGfCclvf5CMBbMXRhOHMXtaO+Dgt6k/OHtm0
	xcOTVV5+NIgxHiYqCQ6VQ3H4V36oa09P86ejGKMlQsdGKp+h54oArxjWBOdlY94HYAMCz7lRlSz
	4bGTs6oJNZ/tqtdqj2t95bWN458LI3ZL/SyHn6g==
X-Google-Smtp-Source: AGHT+IHG2ateeum/Uje9xZ8HLCfUOWS6BVCrZklVdP/xXcY/9sA6a/GK03uHDwyYdokYaPXVysBq+NAthGfqOEN/Jk0=
X-Received: by 2002:a05:6a20:ce89:b0:19c:61d6:d050 with SMTP id
 if9-20020a056a20ce8900b0019c61d6d050mr199714pzb.72.1706215133202; Thu, 25 Jan
 2024 12:38:53 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240125145007.748295-1-tudor.ambarus@linaro.org> <20240125145007.748295-18-tudor.ambarus@linaro.org>
In-Reply-To: <20240125145007.748295-18-tudor.ambarus@linaro.org>
From: Sam Protsenko <semen.protsenko@linaro.org>
Date: Thu, 25 Jan 2024 14:38:41 -0600
Message-ID: <CAPLW+4m+JO=7_hy4BaNtSZj18=ybHtk4n7E939=NEQC4dvdAsA@mail.gmail.com>
Subject: Re: [PATCH v2 17/28] spi: s3c64xx: drop blank line between declarations
To: Tudor Ambarus <tudor.ambarus@linaro.org>
Cc: broonie@kernel.org, andi.shyti@kernel.org, arnd@arndb.de, 
	robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org, 
	alim.akhtar@samsung.com, linux-spi@vger.kernel.org, 
	linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-arch@vger.kernel.org, andre.draszik@linaro.org, 
	peter.griffin@linaro.org, kernel-team@android.com, willmcvicker@google.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 25, 2024 at 8:50=E2=80=AFAM Tudor Ambarus <tudor.ambarus@linaro=
.org> wrote:
>
> Drop the blank line and move the logical operation in the body of the
> function rather than in initialization list.
>
> Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
> ---

Reviewed-by: Sam Protsenko <semen.protsenko@linaro.org>

>  drivers/spi/spi-s3c64xx.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/spi/spi-s3c64xx.c b/drivers/spi/spi-s3c64xx.c
> index 00a0878aeb80..bb6d9bf390a8 100644
> --- a/drivers/spi/spi-s3c64xx.c
> +++ b/drivers/spi/spi-s3c64xx.c
> @@ -1282,8 +1282,9 @@ static int s3c64xx_spi_suspend(struct device *dev)
>  {
>         struct spi_controller *host =3D dev_get_drvdata(dev);
>         struct s3c64xx_spi_driver_data *sdd =3D spi_controller_get_devdat=
a(host);
> +       int ret;
>
> -       int ret =3D spi_controller_suspend(host);
> +       ret =3D spi_controller_suspend(host);
>         if (ret)
>                 return ret;
>
> --
> 2.43.0.429.g432eaa2c6b-goog
>
