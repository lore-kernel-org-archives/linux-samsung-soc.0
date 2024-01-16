Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 766A21CD27
	for <linux-samsung-soc@vger.kernel.org>; Tue, 16 Jan 2024 18:21:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705429298; cv=none; b=LuuozGCPFPCd9+hnVeE0nTqIhwEc6jmCbVLp0jJtYIQUZdKyVU0nnsz/wuijRSZC6ThUr+ZI0E+h5wMovYdPQesr+zWwcMUdhY+1o+3Q0w9T0gX2QcxvSUhgv4xq6welzQf1gcMl8YnWa8Eh9wOmHMSZFUTkNokRBs+w8viNdXI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705429298; c=relaxed/simple;
	bh=iGtilefM/gHGUZFo8PnOopvTKNySbPwZh2/Qz7KBUmA=;
	h=Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Google-Smtp-Source:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:Message-ID:Subject:To:Cc:
	 Content-Type:Content-Transfer-Encoding; b=jXHvfV+JHBx0DWmWTLqkLVMrS9BQLsPpH0xZf6gOJ4YMkRa48SArMc1jDf0F4vjqf+TKGlFrJoyHzty4VQiiagAQOGUrmg+V6CBSm9MrxPZbm2Rh+CTpdZ1sE4KFiwZMXDFAp/uPYX6ERHqsJpNKH4wiVL5FCgF64nBXzN1y4Ow=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=TQ6sLM2u; arc=none smtp.client-ip=209.85.215.174
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="TQ6sLM2u"
Received: by mail-pg1-f174.google.com with SMTP id 41be03b00d2f7-5cddc5455aeso4784716a12.1
        for <linux-samsung-soc@vger.kernel.org>; Tue, 16 Jan 2024 10:21:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1705429297; x=1706034097; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XJipabZ4zYazV9lmvPELaW28mg+mGYQPV3OWXJ3l8Lg=;
        b=TQ6sLM2uV/PtTURW4b5q+1sq0c8VHyX0LyJC/8bqwJmaO7dbxAYGctcl0Hu+Lp6AHq
         rgL/WQeVkGbL7MHjCYPb8jsQXGlckhtMXRQMH7UffadiN1essyf/AMnissPDyJvK+X7J
         tklzASBDvFEOLgNbfit72lUKYpftxmKjI6QkyivkLvtQ9n2b57+W4cBWSuHBfP9wfBXI
         86c1fTgJua8pPh2dBSwNsJ245NvIUs4OTUyKAZyxyV1S6v5FHnxYrGdSLErYOJ+Yq+2T
         zTDXeiszorLzW18N6o8JeR4OTu9/IxjtbCAGydwz/cJB6qJVrVC+cuKaV0XdeqUBemxm
         s2ZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705429297; x=1706034097;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XJipabZ4zYazV9lmvPELaW28mg+mGYQPV3OWXJ3l8Lg=;
        b=QPe0HsbMwnGW3V3HXShvnKsHlYhcrjRcw2oQks5fSx8Lz/n8K/h36ze4vfJhgasmDe
         2V8PrZaVblJZe91l5/eLPw4ImzLh/l/Dziy5pQrwVC5cbXDNAj95eHeUasJ8cALvV4uV
         UJbe6IE1m0YYVfKuBOz/gz0jBxZca6WUkTXEP1vn/BMSKmUXieCj7QG++n+IvMNygPjc
         pOdumKKIT6u1+Gs6VyrXWqbPDRTNGa8AA1bl9mRSLfzPX7Q8SIx887PETu0IXATeL7PF
         38+IMZQdZCAos4bo64qf3jsdTVjtGcO+MljmXMp00fbqGm4ZehzmqUFsfPlPSPHze+nk
         Q8lQ==
X-Gm-Message-State: AOJu0YzRdZ93mVqZS9i6DcoNmdkELkz5BAmIvnhur3zo5G8L4lnsPbWl
	qtin8A5ZT1mudOV63oJ7WGh1fOhJcCkiu1MteuDGM2h3T6D9r0V0R7CT7BXBcYg=
X-Google-Smtp-Source: AGHT+IGD45n2Kmp+42UAAvN1CntcTMHyFOTUd0Yzi86RjPsn4J8yQSUWK55vtqIj7sCnDXiqs0FpmeClEfHPtw8H6Y4=
X-Received: by 2002:a17:90a:d193:b0:28e:79ea:924d with SMTP id
 fu19-20020a17090ad19300b0028e79ea924dmr948652pjb.92.1705429296877; Tue, 16
 Jan 2024 10:21:36 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240110102102.61587-1-tudor.ambarus@linaro.org> <20240110102102.61587-11-tudor.ambarus@linaro.org>
In-Reply-To: <20240110102102.61587-11-tudor.ambarus@linaro.org>
From: Sam Protsenko <semen.protsenko@linaro.org>
Date: Tue, 16 Jan 2024 12:21:25 -0600
Message-ID: <CAPLW+4=YYdUSaaLcsdEyPswC4s6onxuSh24vSfw4xys=sPZG_Q@mail.gmail.com>
Subject: Re: [PATCH 10/18] tty: serial: samsung: make max_count unsigned int
To: Tudor Ambarus <tudor.ambarus@linaro.org>
Cc: krzysztof.kozlowski@linaro.org, alim.akhtar@samsung.com, 
	gregkh@linuxfoundation.org, jirislaby@kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org, 
	andre.draszik@linaro.org, peter.griffin@linaro.org, kernel-team@android.com, 
	willmcvicker@google.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 10, 2024 at 4:23=E2=80=AFAM Tudor Ambarus <tudor.ambarus@linaro=
.org> wrote:
>
> ``max_count`` negative values are not used. Since ``port->fifosize``
> is an unsigned int, make ``max_count`` the same.
>
> Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
> ---
>  drivers/tty/serial/samsung_tty.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/tty/serial/samsung_tty.c b/drivers/tty/serial/samsun=
g_tty.c
> index 90c49197efc7..dbbe6b8e3ceb 100644
> --- a/drivers/tty/serial/samsung_tty.c
> +++ b/drivers/tty/serial/samsung_tty.c
> @@ -760,8 +760,8 @@ static irqreturn_t s3c24xx_serial_rx_chars_dma(void *=
dev_id)
>  static void s3c24xx_serial_rx_drain_fifo(struct s3c24xx_uart_port *ourpo=
rt)
>  {
>         struct uart_port *port =3D &ourport->port;
> +       unsigned int max_count =3D port->fifosize;

What if port->fifosize is 0? Then this code below:

    while (max_count-- > 0) {

would cause int overflow, if max_count is unsigned?

>         unsigned int fifocnt =3D 0;
> -       int max_count =3D port->fifosize;
>         u32 ufcon, ufstat, uerstat;
>         u8 ch, flag;
>
> --
> 2.43.0.472.g3155946c3a-goog
>
>
