Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16B2233062
	for <linux-samsung-soc@vger.kernel.org>; Mon, 24 Mar 2025 15:47:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742831280; cv=none; b=VMo88kcC2o2DAIfd+XcqSoIIDpumV/qv4rXkpsb+/x6kaNte1SbWyIZDpc3YKhQzsQhtDkIUxdIDRhy17dUE744qgttCjKyXEJTAtWP/omVYnYaL64ngnwDF3xRJaiBggSqG5jT4aYh+yUSQyuaBhWxuhfO6V6PHSIE6Kg5kEWs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742831280; c=relaxed/simple;
	bh=KfX1i9ddWnMF1veeO4QVATpiszKHpUMQnXXCqvu+mhM=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=D+GFph0WthMbbXsF0ulowAKxA5FiZI8eQcKoK/TFmos3ensqh4pE2IkjwedsLNuCLw5obxR5TcMQ6Q+D5OEEopD6auA9c97/HefgnSd1cPwrfV1xs8Z7DgGecIacQR7nBlz7yZCTJfPJRm5FQnq0fDbh1Jy3dR04/YY4uR2WaRE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ISsY3WHX; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ISsY3WHX"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-43948f77f1aso30304325e9.0
        for <linux-samsung-soc@vger.kernel.org>; Mon, 24 Mar 2025 08:47:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742831276; x=1743436076; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=kcqZE4qPTQHVucGSFwcIhAMd1jR70HnZWUK0ZLVzwjk=;
        b=ISsY3WHXKaLBMJNZJON9iEldgqRliHKrbPzhHxaiwIDmxL9WS0iSHY3GQBYylvgQuh
         TVaVor3LKspAMenGbU8GDHnYv8DlSD8XGCuAFKpF1pafD5KFrpcl89qBnoefTL3q/E7j
         x90h3K2AQYVCNFbS9rRCvsdq+gHTcjozKJXaNt1pjDvkQ5su6AWhKtzD3YG4xo6t6f1M
         mgiImIX8JtZ1Heg4hP8wJUHaQpvKE1XCein+e3ly2wKmm3hgBJpRi77IxmwcAtkLPcYw
         PsHah/9knCsrsHpXRdH76y88KkbNvDZJo62lH38xhm3F9KXpKLPSLbeS5Rx/9XH/1UFx
         FIFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742831276; x=1743436076;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=kcqZE4qPTQHVucGSFwcIhAMd1jR70HnZWUK0ZLVzwjk=;
        b=gkhRjQSMABJzTOCRW+yYLuMtj9P57OixU28j2VtO8s0SbdHXT18TXoD2w0CG4moAuY
         I7lfl7C6hg10eKRg9EbgM76XetH8kB2t592nROb69o6cpd50MfjSx2yfF3tqT/yOnBFK
         Y+8k4j4lbOsgku0LGGm2tBphvHjasmkB5mlKqdzcCiWL7kInKUR5APAxb5+SOV/7TqZ4
         +2ZlLak85lObza1inShBj70iDubjuaRt45O1ZMgJc6WoUFowz/TpH6NA5K8S8DofRDPt
         DbVSTNw2aGUVujBlxrfO48k/zLy4msrx0j51LiDUUwO+a7XvDrea7co5JnS9ZHZ+7kuM
         iPjA==
X-Forwarded-Encrypted: i=1; AJvYcCUzeYTysMOoUeuR8gS4Rv7uymyJ0G2FaaMJbGVfRfeLeq95WF2PL8KQknN52KJtP+TVsdW882mqkk+KoWIzR0ShAg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzreu+3/NA3mzqX9oaFcVfv5Fga5T8uvuwMXnAqCb7yu6Z0fXJX
	Dh9mnfghsHf1yIrK1cUHc6EWY83/kTbWV7rG3yqA9YVWuGQsvytcHj4W6m5MunU=
X-Gm-Gg: ASbGncsmwRTdljgwf3iiM8CRBlqIlCCyNEjviIDKijDhP7oZVHfUQmuqHZzKfOZpALU
	jZj+1Io4/YRLrW8X/U3cGDLbDw5CXvBclMvAyuf82AW7nVK9fnHbjgdZLt0uTcbDfXZyi2NXRkv
	V+j2UoBTaRFJ5uXHH9FwzQd9+J9YNUmLQ0wLl/Lr6hcWLAlPfkYFgMXB4QL5KiZNigKEPiIvFB0
	VakhJ6lEcUWWHgaDTdN/mXz85yjzYudxPONmxjgmXfo4aD47/Zd6B7Nl7zAuCBJ0LJJ2WovNIWW
	bSsY8MbxIkZHMMgnT2OaAuu+eskR7MxN4B9rjwggazgBbIU/
X-Google-Smtp-Source: AGHT+IGBzu+vnV60NdP98eMQrfOkuiF88fG++TSS8EYBfpDvUraev3a4vJjdZ7/Vc2osVqddWPPKJg==
X-Received: by 2002:a05:600c:249:b0:43d:cc9:b0a3 with SMTP id 5b1f17b1804b1-43d567a2f59mr69800355e9.22.1742831276256;
        Mon, 24 Mar 2025 08:47:56 -0700 (PDT)
Received: from draszik.lan ([80.111.64.44])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43d43f3328bsm174640485e9.1.2025.03.24.08.47.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Mar 2025 08:47:55 -0700 (PDT)
Message-ID: <8c453ce602ab10e09104184fca5310233a9f67e2.camel@linaro.org>
Subject: Re: [PATCH] firmware: exynos-acpm: check saved RX before bailing
 out on empty RX queue
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>
To: Tudor Ambarus <tudor.ambarus@linaro.org>, Krzysztof Kozlowski
	 <krzk@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
	linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, peter.griffin@linaro.org, 
	willmcvicker@google.com, kernel-team@android.com
Date: Mon, 24 Mar 2025 15:47:54 +0000
In-Reply-To: <20250324-acpm-drained-rx-queue-v1-1-577774335151@linaro.org>
References: <20250324-acpm-drained-rx-queue-v1-1-577774335151@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.53.2-1 
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Mon, 2025-03-24 at 12:35 +0000, Tudor Ambarus wrote:
> When we're polling for responses and get a response that corresponds to
> another request, we save the RX data in order to drain the RX queue.
>=20
> If the response for the current request is not found in the request's
> iteration of the queue, or if the queue is empty, we must check whether
> the RX data was saved by a previous request when it drained the RX queue.
>=20
> We failed to check for already saved responses when the queue was empty,
> and requests could time out. Check saved RX before bailing out on empty
> RX queue.
>=20
> Fixes: a88927b534ba ("firmware: add Exynos ACPM protocol driver")
> Reported-by: Andr=C3=A9 Draszik <andre.draszik@linaro.org>
> Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
> ---
> on top of krzk/for-next
> ---
> =C2=A0drivers/firmware/samsung/exynos-acpm.c | 44 +++++++++++++++++++++++=
-----------
> =C2=A01 file changed, 30 insertions(+), 14 deletions(-)
>=20
> diff --git a/drivers/firmware/samsung/exynos-acpm.c b/drivers/firmware/sa=
msung/exynos-acpm.c
> index a85b2dbdd9f0d7b1f327f54a0a283e4f32587a98..15e991b99f5a384a299c1baf6=
b279fc93244bcf2 100644
> --- a/drivers/firmware/samsung/exynos-acpm.c
> +++ b/drivers/firmware/samsung/exynos-acpm.c
> @@ -184,6 +184,29 @@ struct acpm_match_data {
> =C2=A0#define client_to_acpm_chan(c) container_of(c, struct acpm_chan, cl=
)
> =C2=A0#define handle_to_acpm_info(h) container_of(h, struct acpm_info, ha=
ndle)
> =C2=A0
> +/**
> + * acpm_get_saved_rx() - get the response if it was already saved.
> + * @achan:	ACPM channel info.
> + * @xfer:	reference to the transfer to get response for.
> + * @tx_seqnum:	xfer TX sequence number.
> + */
> +static void acpm_get_saved_rx(struct acpm_chan *achan,
> +			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 const struct acpm_xfer *xfer, u32 tx_s=
eqnum)
> +{
> +	const struct acpm_rx_data *rx_data =3D &achan->rx_data[tx_seqnum - 1];
> +	u32 rx_seqnum;
> +
> +	if (!rx_data->response)
> +		return;
> +
> +	rx_seqnum =3D FIELD_GET(ACPM_PROTOCOL_SEQNUM, rx_data->cmd[0]);
> +
> +	if (rx_seqnum =3D=3D tx_seqnum) {

To help the casual reader, maybe add a comment to say that this condition i=
s true
if/when the response was received, and before reception rx_seqnum will be =
=3D=3D 0,
because acpm_prepare_xfer() clears it - i.e. it is not ever supposed to be =
any
arbitrary number. It's kinda implied, but a comment like that would make th=
is
more explicit. If I'm getting this all right.

Other that that;

Reviewed-by: Andr=C3=A9 Draszik <andre.draszik@linaro.org>
Tested-by: Andr=C3=A9 Draszik <andre.draszik@linaro.org>

> +		memcpy(xfer->rxd, rx_data->cmd, xfer->rxlen);
> +		clear_bit(rx_seqnum - 1, achan->bitmap_seqnum);
> +	}
> +}
> +
> =C2=A0/**
> =C2=A0 * acpm_get_rx() - get response from RX queue.
> =C2=A0 * @achan:	ACPM channel info.
> @@ -204,15 +227,16 @@ static int acpm_get_rx(struct acpm_chan *achan, con=
st struct acpm_xfer *xfer)
> =C2=A0	rx_front =3D readl(achan->rx.front);
> =C2=A0	i =3D readl(achan->rx.rear);
> =C2=A0
> -	/* Bail out if RX is empty. */
> -	if (i =3D=3D rx_front)
> +	tx_seqnum =3D FIELD_GET(ACPM_PROTOCOL_SEQNUM, xfer->txd[0]);
> +
> +	if (i =3D=3D rx_front) {
> +		acpm_get_saved_rx(achan, xfer, tx_seqnum);
> =C2=A0		return 0;
> +	}
> =C2=A0
> =C2=A0	base =3D achan->rx.base;
> =C2=A0	mlen =3D achan->mlen;
> =C2=A0
> -	tx_seqnum =3D FIELD_GET(ACPM_PROTOCOL_SEQNUM, xfer->txd[0]);
> -
> =C2=A0	/* Drain RX queue. */
> =C2=A0	do {
> =C2=A0		/* Read RX seqnum. */
> @@ -259,16 +283,8 @@ static int acpm_get_rx(struct acpm_chan *achan, cons=
t struct acpm_xfer *xfer)
> =C2=A0	 * If the response was not in this iteration of the queue, check i=
f the
> =C2=A0	 * RX data was previously saved.
> =C2=A0	 */
> -	rx_data =3D &achan->rx_data[tx_seqnum - 1];
> -	if (!rx_set && rx_data->response) {
> -		rx_seqnum =3D FIELD_GET(ACPM_PROTOCOL_SEQNUM,
> -				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 rx_data->cmd[0]);
> -
> -		if (rx_seqnum =3D=3D tx_seqnum) {
> -			memcpy(xfer->rxd, rx_data->cmd, xfer->rxlen);
> -			clear_bit(rx_seqnum - 1, achan->bitmap_seqnum);
> -		}
> -	}
> +	if (!rx_set)
> +		acpm_get_saved_rx(achan, xfer, tx_seqnum);
> =C2=A0
> =C2=A0	return 0;
> =C2=A0}
>=20
> ---
> base-commit: f0dbe0d40d08199109cb689849877694a8b91033
> change-id: 20250324-acpm-drained-rx-queue-ec316d4cbcdf
>=20
> Best regards,

