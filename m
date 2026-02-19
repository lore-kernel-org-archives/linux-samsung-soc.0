Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DDE22AEE4;
	Thu, 19 Feb 2026 10:31:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771497120; cv=none; b=I/iGKvdMOwT1c4V4ykXN5MzlzVys26yJtIO0QY4k4Nj1HbPsYlJ77ZU82rR6ZUFsZz/Im6aVIPY77p9ddD0V+1iZGp/KLY4SJv7sYsIM4/0ybaDZ3TBKiZU+42irwO6wKAzXpU6EZRBqbx3VqyfvqwCOib6uSl6uc6YgMxADDMs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771497120; c=relaxed/simple;
	bh=LSwkh2+TlJTm+kFGORUAnV70Xkx0GCCd9zawUI90YUU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CuCyF+cSQcmLIc4AWbM1NRP1XeoV14/wcCWzOtVRPbo/Ck6gTvGqEMyxEuG4a4MMntBQy0xdCJM0s+ny7KAP57fFroIzKXqHHDzUMn+/EoEyd9PdSbW9+osqQOMfOVbFjGVvrzxjkC+GROPunytZy72IkioUwrpBlAIFjcxtJwM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gspozHkA; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gspozHkA"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C75ADC2BC86;
	Thu, 19 Feb 2026 10:31:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771497119;
	bh=LSwkh2+TlJTm+kFGORUAnV70Xkx0GCCd9zawUI90YUU=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=gspozHkAKW/9YLd93YuhEIkNS4Fe7X4XR4ejKMKBQ16Mxg5Z8D9o0QG6GORlkeHJ0
	 vQxTKKg4gEwMexiOvCcFAMaaeqqKoufq0VT0SU3k3DJR6k3VhVS5l1UifGgmpKLi2j
	 XVnXVf/TXYXZdfNsQAE3c0Wq0b3CEPTd8Ya5H9RqlEUtP8qVMnLaLzjxsb7qOojheD
	 EE7OhtxClYvn8L4rPbQDSTJtwPA5k6kyjq6GK798zXz4kfNGSntwTlxXt2Vr99J5i6
	 0s4MbILqbk3DoA3dNq4DQiaabnEy7U1m2i0QeklYd8KfTLddrbaRdcSXAqXk3eUOcB
	 /gvZ8ZXW47DLg==
Message-ID: <e6edf006-750a-457d-81bb-83929145e864@kernel.org>
Date: Thu, 19 Feb 2026 11:31:54 +0100
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFT 2/3] firmware: exynos-acpm: Count number of commands
 in acpm_xfer
To: Tudor Ambarus <tudor.ambarus@linaro.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
 Alim Akhtar <alim.akhtar@samsung.com>, Kees Cook <kees@kernel.org>,
 "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 Nathan Chancellor <nathan@kernel.org>,
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>
Cc: linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-hardening@vger.kernel.org,
 llvm@lists.linux.dev
References: <20260214-firmare-acpm-counted-v1-0-32af5735470e@oss.qualcomm.com>
 <20260214-firmare-acpm-counted-v1-2-32af5735470e@oss.qualcomm.com>
 <c9d056fb-b2ae-4631-a2b5-f55f214adecb@linaro.org>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 a/A=
In-Reply-To: <c9d056fb-b2ae-4631-a2b5-f55f214adecb@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 19/02/2026 11:27, Tudor Ambarus wrote:
> 
> 
> On 2/14/26 2:39 PM, Krzysztof Kozlowski wrote:
>> Struct acpm_xfer holds two buffers with u32 commands - rxd and txd - and
>> counts their size by rxlen and txlen.  "len" suffix is here ambiguous,
>> so could mean length of the buffer or length of commands, and these are
>> not the same since each command is u32.  Rename these to rxcnt and
>> txcnt, and change their usage to count the number of commands in each
>> buffer.
>>
>> This will have a benafit of allowing to use __counted_by_ptr later.
> 
>                     ^typo, benefit.

ack

>>
>> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
>> ---
>>  drivers/firmware/samsung/exynos-acpm-dvfs.c |  8 ++++----
>>  drivers/firmware/samsung/exynos-acpm-pmic.c | 14 +++++++-------
>>  drivers/firmware/samsung/exynos-acpm.c      | 12 +++++++-----
>>  drivers/firmware/samsung/exynos-acpm.h      |  4 ++--
>>  4 files changed, 20 insertions(+), 18 deletions(-)
>>
>> diff --git a/drivers/firmware/samsung/exynos-acpm-dvfs.c b/drivers/firmware/samsung/exynos-acpm-dvfs.c
>> index 1c5b2b143bcc..55ec6ad9d87e 100644
>> --- a/drivers/firmware/samsung/exynos-acpm-dvfs.c
>> +++ b/drivers/firmware/samsung/exynos-acpm-dvfs.c
>> @@ -25,11 +25,11 @@ static void acpm_dvfs_set_xfer(struct acpm_xfer *xfer, u32 *cmd, size_t cmdlen,
>>  {
>>  	xfer->acpm_chan_id = acpm_chan_id;
>>  	xfer->txd = cmd;
>> -	xfer->txlen = cmdlen;
>> +	xfer->txcnt = cmdlen;
>>  
>>  	if (response) {
>>  		xfer->rxd = cmd;
>> -		xfer->rxlen = cmdlen;
>> +		xfer->rxcnt = cmdlen;
>>  	}
>>  }
>>  
>> @@ -50,7 +50,7 @@ int acpm_dvfs_set_rate(const struct acpm_handle *handle,
>>  	u32 cmd[4];
>>  
>>  	acpm_dvfs_init_set_rate_cmd(cmd, clk_id, rate);
>> -	acpm_dvfs_set_xfer(&xfer, cmd, sizeof(cmd), acpm_chan_id, false);
>> +	acpm_dvfs_set_xfer(&xfer, cmd, ARRAY_SIZE(cmd), acpm_chan_id, false);
>>  
>>  	return acpm_do_xfer(handle, &xfer);
>>  }
>> @@ -70,7 +70,7 @@ unsigned long acpm_dvfs_get_rate(const struct acpm_handle *handle,
>>  	int ret;
>>  
>>  	acpm_dvfs_init_get_rate_cmd(cmd, clk_id);
>> -	acpm_dvfs_set_xfer(&xfer, cmd, sizeof(cmd), acpm_chan_id, true);
>> +	acpm_dvfs_set_xfer(&xfer, cmd, ARRAY_SIZE(cmd), acpm_chan_id, true);
>>  
>>  	ret = acpm_do_xfer(handle, &xfer);
>>  	if (ret)
>> diff --git a/drivers/firmware/samsung/exynos-acpm-pmic.c b/drivers/firmware/samsung/exynos-acpm-pmic.c
>> index 44265db34ae6..26a9024d8ed8 100644
>> --- a/drivers/firmware/samsung/exynos-acpm-pmic.c
>> +++ b/drivers/firmware/samsung/exynos-acpm-pmic.c
>> @@ -63,8 +63,8 @@ static void acpm_pmic_set_xfer(struct acpm_xfer *xfer, u32 *cmd, size_t cmdlen,
>>  {
>>  	xfer->txd = cmd;
>>  	xfer->rxd = cmd;
>> -	xfer->txlen = cmdlen;
>> -	xfer->rxlen = cmdlen;
>> +	xfer->txcnt = cmdlen;
>> +	xfer->rxcnt = cmdlen;
>>  	xfer->acpm_chan_id = acpm_chan_id;
>>  }
>>  
>> @@ -86,7 +86,7 @@ int acpm_pmic_read_reg(const struct acpm_handle *handle,
>>  	int ret;
>>  
>>  	acpm_pmic_init_read_cmd(cmd, type, reg, chan);
>> -	acpm_pmic_set_xfer(&xfer, cmd, sizeof(cmd), acpm_chan_id);
>> +	acpm_pmic_set_xfer(&xfer, cmd, ARRAY_SIZE(cmd), acpm_chan_id);
>>  
>>  	ret = acpm_do_xfer(handle, &xfer);
>>  	if (ret)
>> @@ -119,7 +119,7 @@ int acpm_pmic_bulk_read(const struct acpm_handle *handle,
>>  		return -EINVAL;
>>  
>>  	acpm_pmic_init_bulk_read_cmd(cmd, type, reg, chan, count);
>> -	acpm_pmic_set_xfer(&xfer, cmd, sizeof(cmd), acpm_chan_id);
>> +	acpm_pmic_set_xfer(&xfer, cmd, ARRAY_SIZE(cmd), acpm_chan_id);
>>  
>>  	ret = acpm_do_xfer(handle, &xfer);
>>  	if (ret)
>> @@ -159,7 +159,7 @@ int acpm_pmic_write_reg(const struct acpm_handle *handle,
>>  	int ret;
>>  
>>  	acpm_pmic_init_write_cmd(cmd, type, reg, chan, value);
>> -	acpm_pmic_set_xfer(&xfer, cmd, sizeof(cmd), acpm_chan_id);
>> +	acpm_pmic_set_xfer(&xfer, cmd, ARRAY_SIZE(cmd), acpm_chan_id);
>>  
>>  	ret = acpm_do_xfer(handle, &xfer);
>>  	if (ret)
>> @@ -199,7 +199,7 @@ int acpm_pmic_bulk_write(const struct acpm_handle *handle,
>>  		return -EINVAL;
>>  
>>  	acpm_pmic_init_bulk_write_cmd(cmd, type, reg, chan, count, buf);
>> -	acpm_pmic_set_xfer(&xfer, cmd, sizeof(cmd), acpm_chan_id);
>> +	acpm_pmic_set_xfer(&xfer, cmd, ARRAY_SIZE(cmd), acpm_chan_id);
>>  
>>  	ret = acpm_do_xfer(handle, &xfer);
>>  	if (ret)
>> @@ -229,7 +229,7 @@ int acpm_pmic_update_reg(const struct acpm_handle *handle,
>>  	int ret;
>>  
>>  	acpm_pmic_init_update_cmd(cmd, type, reg, chan, value, mask);
>> -	acpm_pmic_set_xfer(&xfer, cmd, sizeof(cmd), acpm_chan_id);
>> +	acpm_pmic_set_xfer(&xfer, cmd, ARRAY_SIZE(cmd), acpm_chan_id);
>>  
>>  	ret = acpm_do_xfer(handle, &xfer);
>>  	if (ret)
>> diff --git a/drivers/firmware/samsung/exynos-acpm.c b/drivers/firmware/samsung/exynos-acpm.c
>> index 0cb269c70460..242745e8394c 100644
>> --- a/drivers/firmware/samsung/exynos-acpm.c
>> +++ b/drivers/firmware/samsung/exynos-acpm.c
>> @@ -205,7 +205,7 @@ static void acpm_get_saved_rx(struct acpm_chan *achan,
>>  	rx_seqnum = FIELD_GET(ACPM_PROTOCOL_SEQNUM, rx_data->cmd[0]);
>>  
>>  	if (rx_seqnum == tx_seqnum) {
>> -		memcpy(xfer->rxd, rx_data->cmd, xfer->rxlen);
>> +		memcpy(xfer->rxd, rx_data->cmd, xfer->rxcnt * sizeof(*xfer->rxd));
>>  		clear_bit(rx_seqnum - 1, achan->bitmap_seqnum);
>>  	}
>>  }
>> @@ -259,7 +259,7 @@ static int acpm_get_rx(struct acpm_chan *achan, const struct acpm_xfer *xfer)
>>  		if (rx_data->response) {
>>  			if (rx_seqnum == tx_seqnum) {
>>  				__ioread32_copy(xfer->rxd, addr,
>> -						xfer->rxlen / 4);
>> +						xfer->rxcnt);
> 
> now __ioread32_copy fits on a single line, without bypassing 80 chars


ack

> 
>>  				rx_set = true;
>>  				clear_bit(seqnum, achan->bitmap_seqnum);
>>  			} else {
>> @@ -270,7 +270,7 @@ static int acpm_get_rx(struct acpm_chan *achan, const struct acpm_xfer *xfer)
>>  				 * after the response is copied to the request.
>>  				 */
>>  				__ioread32_copy(rx_data->cmd, addr,
>> -						xfer->rxlen / 4);
>> +						xfer->rxcnt);
>>  			}
>>  		} else {
>>  			clear_bit(seqnum, achan->bitmap_seqnum);
>> @@ -425,7 +425,9 @@ int acpm_do_xfer(const struct acpm_handle *handle, const struct acpm_xfer *xfer)
>>  
>>  	achan = &acpm->chans[xfer->acpm_chan_id];
>>  
>> -	if (!xfer->txd || xfer->txlen > achan->mlen || xfer->rxlen > achan->mlen)
>> +	if (!xfer->txd || (xfer->txcnt * sizeof(*xfer->txd) > achan->mlen))
>> +		return -EINVAL;
>> +	if (xfer->rxcnt * sizeof(*xfer->rxd) > achan->mlen)
>>  		return -EINVAL;
> 
> how about:
>         if (!xfer->txd ||
>             (xfer->txcnt * sizeof(*xfer->txd) > achan->mlen) ||
>             (xfer->rxcnt * sizeof(*xfer->rxd) > achan->mlen))
>                 return -EINVAL;


sure, I don't have a preference.


Best regards,
Krzysztof
