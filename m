Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 781112E7F3A
	for <linux-samsung-soc@vger.kernel.org>; Thu, 19 Feb 2026 10:27:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771496865; cv=none; b=Jgy/Lj6hAAgZUhJC8bC6c7Kl7Pc6Sy6aoNUFLdochTvoxWDTADiFoEZlaxavlzpjJM2jKRkMs5n0vDtWEYp2SJmTuQhKDqrOCj6WHUq04MlhNb4DctE+J3pNPKRachBKia9zYQD6seQeeMYLpC4SD0yZWokF5cB+vY8CO6PNFH8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771496865; c=relaxed/simple;
	bh=ee5d/mCDomKopEZqYC6zk/SC4+1mGi1VGHehStvSk1c=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=csSy4KX0a49zN6wyJ+AopnKs04qbJUFZ3ozFG+MEcwhEVRaIWNmS7VSH3joNIbNgkR/jgJKy7pj9CnlS2NMtdgCysrH4OqipKEHEEXW1yqaIA5IIVqBScvEBsxwJW45jJXOyru59zz6FEoJ7EDD/jZIGfXCfUNUyEWTrOqy9WEI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=J+DDI8vv; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="J+DDI8vv"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-43770c94dfaso810551f8f.2
        for <linux-samsung-soc@vger.kernel.org>; Thu, 19 Feb 2026 02:27:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1771496861; x=1772101661; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=HNZVSXjVxH1eQkOT7lQSAOIyjM/HYvFDSZC+egPazHI=;
        b=J+DDI8vvwoaJCOtowrFNWR/XWLC3IcJAs7QYeQgKp9WKRdhFL3jDJg/sf15DNLj5IP
         81CPtCtPCkwX13goFk+DGMHv+iBcuaqts4I9XNpmacs/psIZSFZlsyfynwkFY5yOnsmH
         ++buddodkiuptuhn7WjI6DpDquJdeefSWRArHpM0rp8o3Doc6LxB6Cg6E5Cs6BEXLSV7
         YG/tXORhZk/ZEeiq5AQMfuF3ZEHInmJ6TMFdv89Hy8GHdwZRgR40uDP0VU6ATNnHC3ld
         aNW7zAOG4K9/5gHWcba4+E2al4TjWR2f2jWxvWsof/A6s1kY1hqxbd5RBrl2r0OJv14k
         zgXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771496861; x=1772101661;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HNZVSXjVxH1eQkOT7lQSAOIyjM/HYvFDSZC+egPazHI=;
        b=NlV6Hx6nclvp9LpPtrZr7V5sw1tFQNFsPzMmd/vSwKykAKpQzUvnt96MEh9TCh0ohv
         zaq0hdQKUIIMIMdbMHR3Ab5I4xoe28Phzbkjb+fNOvJYurV3J1nwLsv8mesBKgb/zd89
         wxvjiDoM9HONKOUq1ZnDgbN5ZxGi5UuYamvutyvDD6CXV8Z0Br1celTiGZgE3+bgKF/m
         8S7oHMiSdYR+Sw8q5eoAf9/+ULTZMIPc2p/9KKLecrA6BbEzo5dK9q6y8xUUWZeY1BCu
         hsEqoXxex0kCdBxJGRvkr/0hYXdctqmngeixFKghXUTyGDDSf+p9yf4+fA0JJhglX85i
         dxKQ==
X-Forwarded-Encrypted: i=1; AJvYcCXBMH1NnVornRYusOfTIOvuFNRmiL8i6iVpthN9umXpY5faEHH1PqhKOM3le1LO/ioDt63tYiZ3HdNexbNlFsWDYw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw6N/0FGVaqVe13Fa4iQIXZkQ3mFf/vNo2yqX14ij4vSt157WUi
	p4KVBkHyWJgVdN6KCSC1ZzfKs0LGw4TmDhe07kiZRHZxD4MDXvqwxsNRR3MgIQp54k0=
X-Gm-Gg: AZuq6aKdteMEdPtqtEmwFMV+P9CGSxxy/H7031mM5NcWZVxaMZSuSHKG/ykSVv/TxaK
	xh4Us0Wc73WM7rk/c4l+oyqoYwnGGoGKmjQaInRr2+B6WriKT+S9Y8lt5d7KebrGHVqy846XH2K
	yHzOX0p55fwlRSb2stYc+3erO9SqCcZt0nJbIWHAQ5wHN5+euaR7nJE3I7UFolvbjV8iECOmX1t
	K/oc75ccg1sKx+6xo8K1v2h+IxUKSLGjtM2OKJSWWM1JF72QOQdu+h50wLVejQ4ACuitkoPnrHO
	CivpRjaNbfZwb6ADLRBw7UPYx/W/rydWCH20a5zMTO2dFROt4m6CcBvfrgZBoetE14qCs3J31a8
	jqFs2mcf4fh7vYKEXFINYInFzoUXBUDHISGJnkrvfpkXBoj7ma/NCMbG4ySrM0DoXdpm3w+SjSe
	sPX1CILvMjlgtiewLEszSY5jYfFr0HQ75I
X-Received: by 2002:a5d:5d82:0:b0:436:da9:4371 with SMTP id ffacd0b85a97d-43958df1144mr9512620f8f.5.1771496860699;
        Thu, 19 Feb 2026 02:27:40 -0800 (PST)
Received: from [10.11.12.108] ([79.115.63.134])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43796abc8b1sm50341008f8f.23.2026.02.19.02.27.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Feb 2026 02:27:40 -0800 (PST)
Message-ID: <c9d056fb-b2ae-4631-a2b5-f55f214adecb@linaro.org>
Date: Thu, 19 Feb 2026 12:27:39 +0200
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFT 2/3] firmware: exynos-acpm: Count number of commands
 in acpm_xfer
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
 Krzysztof Kozlowski <krzk@kernel.org>, Alim Akhtar
 <alim.akhtar@samsung.com>, Kees Cook <kees@kernel.org>,
 "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 Nathan Chancellor <nathan@kernel.org>,
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>
Cc: linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-hardening@vger.kernel.org,
 llvm@lists.linux.dev
References: <20260214-firmare-acpm-counted-v1-0-32af5735470e@oss.qualcomm.com>
 <20260214-firmare-acpm-counted-v1-2-32af5735470e@oss.qualcomm.com>
Content-Language: en-US
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <20260214-firmare-acpm-counted-v1-2-32af5735470e@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 2/14/26 2:39 PM, Krzysztof Kozlowski wrote:
> Struct acpm_xfer holds two buffers with u32 commands - rxd and txd - and
> counts their size by rxlen and txlen.  "len" suffix is here ambiguous,
> so could mean length of the buffer or length of commands, and these are
> not the same since each command is u32.  Rename these to rxcnt and
> txcnt, and change their usage to count the number of commands in each
> buffer.
> 
> This will have a benafit of allowing to use __counted_by_ptr later.

                    ^typo, benefit.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> ---
>  drivers/firmware/samsung/exynos-acpm-dvfs.c |  8 ++++----
>  drivers/firmware/samsung/exynos-acpm-pmic.c | 14 +++++++-------
>  drivers/firmware/samsung/exynos-acpm.c      | 12 +++++++-----
>  drivers/firmware/samsung/exynos-acpm.h      |  4 ++--
>  4 files changed, 20 insertions(+), 18 deletions(-)
> 
> diff --git a/drivers/firmware/samsung/exynos-acpm-dvfs.c b/drivers/firmware/samsung/exynos-acpm-dvfs.c
> index 1c5b2b143bcc..55ec6ad9d87e 100644
> --- a/drivers/firmware/samsung/exynos-acpm-dvfs.c
> +++ b/drivers/firmware/samsung/exynos-acpm-dvfs.c
> @@ -25,11 +25,11 @@ static void acpm_dvfs_set_xfer(struct acpm_xfer *xfer, u32 *cmd, size_t cmdlen,
>  {
>  	xfer->acpm_chan_id = acpm_chan_id;
>  	xfer->txd = cmd;
> -	xfer->txlen = cmdlen;
> +	xfer->txcnt = cmdlen;
>  
>  	if (response) {
>  		xfer->rxd = cmd;
> -		xfer->rxlen = cmdlen;
> +		xfer->rxcnt = cmdlen;
>  	}
>  }
>  
> @@ -50,7 +50,7 @@ int acpm_dvfs_set_rate(const struct acpm_handle *handle,
>  	u32 cmd[4];
>  
>  	acpm_dvfs_init_set_rate_cmd(cmd, clk_id, rate);
> -	acpm_dvfs_set_xfer(&xfer, cmd, sizeof(cmd), acpm_chan_id, false);
> +	acpm_dvfs_set_xfer(&xfer, cmd, ARRAY_SIZE(cmd), acpm_chan_id, false);
>  
>  	return acpm_do_xfer(handle, &xfer);
>  }
> @@ -70,7 +70,7 @@ unsigned long acpm_dvfs_get_rate(const struct acpm_handle *handle,
>  	int ret;
>  
>  	acpm_dvfs_init_get_rate_cmd(cmd, clk_id);
> -	acpm_dvfs_set_xfer(&xfer, cmd, sizeof(cmd), acpm_chan_id, true);
> +	acpm_dvfs_set_xfer(&xfer, cmd, ARRAY_SIZE(cmd), acpm_chan_id, true);
>  
>  	ret = acpm_do_xfer(handle, &xfer);
>  	if (ret)
> diff --git a/drivers/firmware/samsung/exynos-acpm-pmic.c b/drivers/firmware/samsung/exynos-acpm-pmic.c
> index 44265db34ae6..26a9024d8ed8 100644
> --- a/drivers/firmware/samsung/exynos-acpm-pmic.c
> +++ b/drivers/firmware/samsung/exynos-acpm-pmic.c
> @@ -63,8 +63,8 @@ static void acpm_pmic_set_xfer(struct acpm_xfer *xfer, u32 *cmd, size_t cmdlen,
>  {
>  	xfer->txd = cmd;
>  	xfer->rxd = cmd;
> -	xfer->txlen = cmdlen;
> -	xfer->rxlen = cmdlen;
> +	xfer->txcnt = cmdlen;
> +	xfer->rxcnt = cmdlen;
>  	xfer->acpm_chan_id = acpm_chan_id;
>  }
>  
> @@ -86,7 +86,7 @@ int acpm_pmic_read_reg(const struct acpm_handle *handle,
>  	int ret;
>  
>  	acpm_pmic_init_read_cmd(cmd, type, reg, chan);
> -	acpm_pmic_set_xfer(&xfer, cmd, sizeof(cmd), acpm_chan_id);
> +	acpm_pmic_set_xfer(&xfer, cmd, ARRAY_SIZE(cmd), acpm_chan_id);
>  
>  	ret = acpm_do_xfer(handle, &xfer);
>  	if (ret)
> @@ -119,7 +119,7 @@ int acpm_pmic_bulk_read(const struct acpm_handle *handle,
>  		return -EINVAL;
>  
>  	acpm_pmic_init_bulk_read_cmd(cmd, type, reg, chan, count);
> -	acpm_pmic_set_xfer(&xfer, cmd, sizeof(cmd), acpm_chan_id);
> +	acpm_pmic_set_xfer(&xfer, cmd, ARRAY_SIZE(cmd), acpm_chan_id);
>  
>  	ret = acpm_do_xfer(handle, &xfer);
>  	if (ret)
> @@ -159,7 +159,7 @@ int acpm_pmic_write_reg(const struct acpm_handle *handle,
>  	int ret;
>  
>  	acpm_pmic_init_write_cmd(cmd, type, reg, chan, value);
> -	acpm_pmic_set_xfer(&xfer, cmd, sizeof(cmd), acpm_chan_id);
> +	acpm_pmic_set_xfer(&xfer, cmd, ARRAY_SIZE(cmd), acpm_chan_id);
>  
>  	ret = acpm_do_xfer(handle, &xfer);
>  	if (ret)
> @@ -199,7 +199,7 @@ int acpm_pmic_bulk_write(const struct acpm_handle *handle,
>  		return -EINVAL;
>  
>  	acpm_pmic_init_bulk_write_cmd(cmd, type, reg, chan, count, buf);
> -	acpm_pmic_set_xfer(&xfer, cmd, sizeof(cmd), acpm_chan_id);
> +	acpm_pmic_set_xfer(&xfer, cmd, ARRAY_SIZE(cmd), acpm_chan_id);
>  
>  	ret = acpm_do_xfer(handle, &xfer);
>  	if (ret)
> @@ -229,7 +229,7 @@ int acpm_pmic_update_reg(const struct acpm_handle *handle,
>  	int ret;
>  
>  	acpm_pmic_init_update_cmd(cmd, type, reg, chan, value, mask);
> -	acpm_pmic_set_xfer(&xfer, cmd, sizeof(cmd), acpm_chan_id);
> +	acpm_pmic_set_xfer(&xfer, cmd, ARRAY_SIZE(cmd), acpm_chan_id);
>  
>  	ret = acpm_do_xfer(handle, &xfer);
>  	if (ret)
> diff --git a/drivers/firmware/samsung/exynos-acpm.c b/drivers/firmware/samsung/exynos-acpm.c
> index 0cb269c70460..242745e8394c 100644
> --- a/drivers/firmware/samsung/exynos-acpm.c
> +++ b/drivers/firmware/samsung/exynos-acpm.c
> @@ -205,7 +205,7 @@ static void acpm_get_saved_rx(struct acpm_chan *achan,
>  	rx_seqnum = FIELD_GET(ACPM_PROTOCOL_SEQNUM, rx_data->cmd[0]);
>  
>  	if (rx_seqnum == tx_seqnum) {
> -		memcpy(xfer->rxd, rx_data->cmd, xfer->rxlen);
> +		memcpy(xfer->rxd, rx_data->cmd, xfer->rxcnt * sizeof(*xfer->rxd));
>  		clear_bit(rx_seqnum - 1, achan->bitmap_seqnum);
>  	}
>  }
> @@ -259,7 +259,7 @@ static int acpm_get_rx(struct acpm_chan *achan, const struct acpm_xfer *xfer)
>  		if (rx_data->response) {
>  			if (rx_seqnum == tx_seqnum) {
>  				__ioread32_copy(xfer->rxd, addr,
> -						xfer->rxlen / 4);
> +						xfer->rxcnt);

now __ioread32_copy fits on a single line, without bypassing 80 chars

>  				rx_set = true;
>  				clear_bit(seqnum, achan->bitmap_seqnum);
>  			} else {
> @@ -270,7 +270,7 @@ static int acpm_get_rx(struct acpm_chan *achan, const struct acpm_xfer *xfer)
>  				 * after the response is copied to the request.
>  				 */
>  				__ioread32_copy(rx_data->cmd, addr,
> -						xfer->rxlen / 4);
> +						xfer->rxcnt);
>  			}
>  		} else {
>  			clear_bit(seqnum, achan->bitmap_seqnum);
> @@ -425,7 +425,9 @@ int acpm_do_xfer(const struct acpm_handle *handle, const struct acpm_xfer *xfer)
>  
>  	achan = &acpm->chans[xfer->acpm_chan_id];
>  
> -	if (!xfer->txd || xfer->txlen > achan->mlen || xfer->rxlen > achan->mlen)
> +	if (!xfer->txd || (xfer->txcnt * sizeof(*xfer->txd) > achan->mlen))
> +		return -EINVAL;
> +	if (xfer->rxcnt * sizeof(*xfer->rxd) > achan->mlen)
>  		return -EINVAL;

how about:
        if (!xfer->txd ||
            (xfer->txcnt * sizeof(*xfer->txd) > achan->mlen) ||
            (xfer->rxcnt * sizeof(*xfer->rxd) > achan->mlen))
                return -EINVAL;

>  
>  	if (!achan->poll_completion) {
> @@ -448,7 +450,7 @@ int acpm_do_xfer(const struct acpm_handle *handle, const struct acpm_xfer *xfer)
>  
>  		/* Write TX command. */
>  		__iowrite32_copy(achan->tx.base + achan->mlen * tx_front,
> -				 xfer->txd, xfer->txlen / 4);
> +				 xfer->txd, xfer->txcnt);
>  
>  		/* Advance TX front. */
>  		writel(idx, achan->tx.front);
> diff --git a/drivers/firmware/samsung/exynos-acpm.h b/drivers/firmware/samsung/exynos-acpm.h
> index 2d14cb58f98c..422fbcac7284 100644
> --- a/drivers/firmware/samsung/exynos-acpm.h
> +++ b/drivers/firmware/samsung/exynos-acpm.h
> @@ -10,8 +10,8 @@
>  struct acpm_xfer {
>  	const u32 *txd;
>  	u32 *rxd;
> -	size_t txlen;
> -	size_t rxlen;
> +	size_t txcnt;
> +	size_t rxcnt;
>  	unsigned int acpm_chan_id;
>  };
>  
> 

