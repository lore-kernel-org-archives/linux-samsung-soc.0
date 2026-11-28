Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795873134;
	b=5hPxA4E/y1z/2LTW3kMylRrT8mu029FRmKaV1jgZA7MK1DBYYq0zMA+U7ziIpsqNyJEH
	 ZpWr0ff1XQ5pIzrha7Qkr+cyWmYp3pVDTzTHDR/w9asG5Poljro88sCLURc++VhC/aFm8
	 YaoHLJUc/Stda8nXsvEZ7NyvttTdfpb4uuHeNFtWHrd45zu3EhxTZNVKysu+bbJPb9upk
	 TTaknyR3cFkizIucE7sdmnwdUtXXbkPyIvDFeHHiaSrdCa83UXoOn4kmku5hwTFhLEJB1
	 9/OjkXTxfOdxjMicoYFM6F6iKbKJXLPxxlb35ZHcfByeQztBWe1FJpNwwbF3z2l7/cA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795873134;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=dCmAGX2Omd/g9y7jDZCpeWTJ9I+W1z7gL0oCYL7gw10=;
	b=YM94/Sx2SGiPHnfNQnXcgU6xx4GXPiXy0IvMaAkN4+IzwMZtjbybn2QPqOyaeJHI+3Ma
	 WQo2S/wxqc0WH1J0fhcd9HtVIhHAS2h9deD/80xdMrBXxswoBNzzs3EOosHsv7BPkgxqG
	 CSsq3hHdVs9WKhstiGU7noHXeAignOcDUhbsHvG0nfhh5tW2Ulv4P8f6RViKkj1dLhtw4
	 H/91kLCfpoK3UdEJbPYDcU5/gLRiaWfo2gcDWOQwhsTqQHOc/NxlGnF6K4HHeExVTYtDk
	 QwDffeVBX1rzwIoKO/YDWWdFbUucFizmNCV9lqVWKtcPyenjftSPjLHBN6TF1AC/7rg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=wTyeE1UY;
	arc=none smtp.remote-ip=209.85.167.49
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 106B1606A31F
	for <linux-samsung-soc@vger.kernel.org>; Sat, 28 Nov 2026 13:38:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 106B1606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=wTyeE1UY
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-5c14f3dab09so4395967e87.0
        for <linux-samsung-soc@vger.kernel.org>; Sat, 28 Nov 2026 05:38:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795873132; x=1796477932; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dCmAGX2Omd/g9y7jDZCpeWTJ9I+W1z7gL0oCYL7gw10=;
        b=wTyeE1UYXKFFlRlLAUJLkr9C9/Brmuh5IhKjiX+lPzzs+/9twKhj5S3a4LKPpGRO1R
         Z2KoeptxVlTXvErSql4Wy15JF/SLVpFMKE3Tj9EUe6EQhCTaBdAZKXYuA6NVcvs/TPa0
         Qonbh/BnIA+78Piovo5I7+tHAke7nbjedz8z0p8bN8hdosjDNMQR9HylVUq+qa6g9rxE
         hp2CX8u+SswX1VCZhDsVuBkYmC5Sh4ktO4nsAWbzXUuBQKmjxmqnJHPn5cEQB9AlR/ZP
         vDK9sEvN9TUdDS84TIyfSlMdsXwGKBS2IG8Jh7QSnZPqoFUCIk77zqz4WPa+L0yWaCgr
         0XBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795873132; x=1796477932;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dCmAGX2Omd/g9y7jDZCpeWTJ9I+W1z7gL0oCYL7gw10=;
        b=kqoHZxaxHSp3ahKJ1Xj3dTqGaTIAxbYB5lEJOKTQKEyAYunMxnxM8IwnoxPrzinhk1
         Y4YS1vGExdQvRMlWLH+/gnS+Hao1qVMhEySRgfafhGj66mpOgiUduxMn5a+gFnB9+sCm
         itY+s0OEFBfDIBaoKHJ0RnBZEmSTFzp0ZMfI/5/mTVi05oKeqjHyMfZSKDhdmHrhvQPm
         2Q5abBRQqU+asEiLbda8QinnLlu7zeOiglLOM3fmUYMEXBVW9Pq6pLUo19ylOblktRT1
         UWig+gsFdRNxgXowCVmX6T+CWVIPIg6Xlej8PxJgHGKg104xG5mDKxANbwhfwgbI3RbD
         F0hA==
X-Forwarded-Encrypted: i=1; AL+hErE7h6vVRsaPOBR0FeAic4gCPrNHPs5fqoLUR1hKrUNncrNLbe3OK5f6CX6CuNPMAQMkg3ME+g0n/Oc8ogAO8ZQAtQ==@vger.kernel.org
X-Gm-Message-State: APuU4Z9WfGDiS0GQqYmV38PIxjkEqTtm4Per0G25a/Hl4n7Dq+zk8mPJ
	8LG58avV2XuUKJE3QZ5GCpDVIKc/yL0mt8BebnZDFoi6+UcLN3R9DWvQ
X-Gm-Gg: AZFdTZeHR8OotX4EQVTXGayMko1mH1gRmP0CMCsSrwSiBA9+kinKWGOF5HBdeKOj4i2
	Eq5hqJUuiQ/hV7UTfBkWLitBdnsg6ioQoQOSDZXDPGzFiuN9UChtII8fe53nmWPdC2BOVYlKz96
	sFL8l5vapZBRSzLpqeVwZrVfo/LK6iLGKpAzG9N40r4P3dN4cXq6z+KOBrCsP1nu8ev1sI1/1f/
	BcPA2LAUB5RcA05ju2iSIDzSGeIefjLy7McTfOSkqcW1Xm94seWIf3wI5i0kCkO3250mSIj+KL+
	/93WFNcfLOWCVYkNaBA5mfDsgr1RN0o4y/ioX7V8IXOkTdOU5UdlJ+6yI3BznniF23F+QZMvVXW
	qHKooxYDe2U6GXP1hzQuxGVqIXXbVMAz7F4o7hOK6NKgT2Zr2MxbuF2d196nSfpvMHeHdQ5usBB
	Pd/V7rQpDoEAhkHyK/mgECNRhE5852veCevPWPqmEL1jb5YBV/0aRdldOSqOyNjBAZa336anfSz
	NOdixNztuLVZcgDm1/XTwEp9WfP6e+uwydmPGmVzhXYaQbyTAsHrK8CXRBNufV/Yu3oaJ/azw7h
	zv/Di3rqAtmIQcHvVmbLCjL3dnURIPQA8LYFRLdZVQfk
X-Received: by 2002:a05:6512:3b89:b0:5c3:3dfd:c4e8 with SMTP id 2adb3069b0e04-5c33dfdc807mr1617419e87.2.1795873131953;
        Sat, 28 Nov 2026 05:38:51 -0800 (PST)
Received: from [10.127.127.83] ([5.195.0.145])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5c1bcff8b82sm6968991e87.16.2026.11.28.05.38.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 28 Nov 2026 05:38:50 -0800 (PST)
Message-ID: <2528005e-67b5-4e23-a357-fbf853c2ff38@gmail.com>
Date: Sat, 28 Nov 2026 17:38:44 +0400
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Post: <mailto:linux-samsung-soc@vger.kernel.org>
List-Help: <mailto:linux-samsung-soc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-samsung-soc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 10/12] clk: samsung: exynos8895: Terminate PLL rate tables
 with sentinels
To: Lee Jones <lee@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>,
 Sylwester Nawrocki <s.nawrocki@samsung.com>,
 Chanwoo Choi <cw00.choi@samsung.com>,
 Peter Griffin <peter.griffin@linaro.org>,
 Alim Akhtar <alim.akhtar@samsung.com>, Stephen Boyd <sboyd@kernel.org>,
 Brian Masney <bmasney+clk@redhat.com>,
 Jerome Brunet <jbrunet+clk@baylibre.com>,
 =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig_=28The_Capable_Hub=29?=
 <u.kleine-koenig@baylibre.com>, Bjorn Helgaas <bhelgaas@google.com>,
 Takashi Sakamoto <o-takashi@sakamocchi.jp>,
 Danilo Krummrich <dakr@kernel.org>, linux-samsung-soc@vger.kernel.org,
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Cc: stable@vger.kernel.org
References: <20261127180416.3277544-1-lee@kernel.org>
 <20261127180416.3277544-11-lee@kernel.org>
Content-Language: en-US
From: ivaylo ivanov <ivo.ivanov.ivanov1@gmail.com>
In-Reply-To: <20261127180416.3277544-11-lee@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/27/26 22:03, Lee Jones wrote:
> _samsung_clk_register_pll() sizes each PLL rate table by scanning until
> it encounters an entry with .rate == 0, then copies the counted entries
> into pll->rate_table.  However, pll_shared0_rate_table,
> pll_shared1_rate_table, pll_shared2_rate_table, pll_shared3_rate_table,
> and pll_shared4_rate_table all omit a terminating zero sentinel, causing
> out-of-bounds reads into adjacent read-only data and populating
> pll->rate_table with bogus entries.
>
> Append a sentinel entry to each of the 5 PLL rate tables.
>
> Fixes: 9174fac3b302 ("clk: samsung: Introduce Exynos8895 clock driver")

Looks good to me. Thanks, nice catch!

Reviewed-by: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>

> Cc: stable@vger.kernel.org
> Signed-off-by: Lee Jones <lee@kernel.org>
> ---
>   drivers/clk/samsung/clk-exynos8895.c | 5 +++++
>   1 file changed, 5 insertions(+)
>
> diff --git a/drivers/clk/samsung/clk-exynos8895.c b/drivers/clk/samsung/clk-exynos8895.c
> index 259481c4276e..daf337f47e4f 100644
> --- a/drivers/clk/samsung/clk-exynos8895.c
> +++ b/drivers/clk/samsung/clk-exynos8895.c
> @@ -478,22 +478,27 @@ static const unsigned long top_clk_regs[] __initconst = {
>   
>   static const struct samsung_pll_rate_table pll_shared0_rate_table[] __initconst = {
>   	PLL_35XX_RATE(26 * MHZ, 2132000000U, 328, 4, 0),
> +	{ /* sentinel */ }
>   };
>   

...

Best regards,
Ivaylo
