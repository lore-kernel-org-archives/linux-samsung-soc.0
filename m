Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794599238;
	b=OHoSv+h149WKqAq/R2xWh8zDJ6/4GJYPrDQFAhUindPDUULk9+1WBzx1urXSAwOhgKqb
	 ww0mNZAXgsCQbOpiahe+rJixJMN3OlblilpwApB/1lM7gJog98lI0KcOIq1R5LYxvgVIS
	 RuR9jbNUP3yEXOXYJum94f8WDdOuqg5L+a+6BhtyTWWKiXt455L+0lYwRB0S/6XFCjFaN
	 0mJI68ukAqJqb7Xv8vf0wpu7qc6ZunDLIOYT9Ri9ck46g8IDqztTZznVFHYl26uO4fLD0
	 VOtZIq6qqAUrj5Szlui5tAdEByVBawq5fJ56lzZlAzgrQhwTeJJePutHpTj9nTWcdwg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794599238;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=IeG8GW29CPTq2V+5DOuKsl8l1CpVGznlbRHng5hlVeQ=;
	b=ZkDYXJ3A/VBIEFp4O6FmCp8/vMNi+cXoNd/6zcLxJ0upeKqAyMJJ7L02r/NYl2pQS8gM
	 d8+vqX7kveUbcHByHeBB6ows66CoXeTFiZi7WxHFxjS1e8e74zg5D4kYFIyU3K9BWqmMS
	 mrgL58URJ8ji3BjQCj+fOUbYpbaitW0nyS5LYoszmNiV1yvW/Ra6K3iOyzE7HlWjmudbH
	 SRPfElelHeGM9kGHowcA8/yP1E+2kcX04AMRondnqYWWjZkNDDZXID6kMctY2iF8FybFn
	 2whU0+LsCYwJtS0QNiEk2gWOtWb0qZhfL1NWgUxzjKKHk2ttd4Zo1wq9VICNhvOaTQw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=FGpcEftj;
	arc=none smtp.remote-ip=74.125.82.181
Received: from mail-dy1-f181.google.com (mail-dy1-f181.google.com [74.125.82.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B707A606A330
	for <linux-samsung-soc@vger.kernel.org>; Fri, 13 Nov 2026 19:47:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B707A606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=FGpcEftj
Received: by mail-dy1-f181.google.com with SMTP id 5a478bee46e88-3720addb068so2185947eec.1
        for <linux-samsung-soc@vger.kernel.org>; Fri, 13 Nov 2026 11:47:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794599237; x=1795204037; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IeG8GW29CPTq2V+5DOuKsl8l1CpVGznlbRHng5hlVeQ=;
        b=FGpcEftjGf/8FeLN5xx8lCOAqwDTwoq4kDQD/mgzYbfy+mu5nR+BGXOJ0a/01GFvSx
         Eq53qQ35WUOg89/AJrzV5OQu5EVEf3qMAdin182glN9Yl0/NWgtVQYH//8aOcdKYqavQ
         lK10NcJw7FiG4CTWFP95gxEDOspGbopsMws5QHEQKGHGVPC2d6jLoeUeDBTfJvg+V8Mr
         Op7NpOmFiIIWblp6grKK+UhaJ5tTzIoVh7hSgqJYlYx9M4ot0z3Ae4T6pxW/hQzcQfPd
         GKjPKAbhFHA12Ato5S20OJM6PdX3IPwr/KngIqGmYk13Znt7ecuUm5ULe5biyqNw5LuW
         K9ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794599237; x=1795204037;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IeG8GW29CPTq2V+5DOuKsl8l1CpVGznlbRHng5hlVeQ=;
        b=qJ2E9u/melkWLsj8rXpCYxqnMiYfl2Dl3R6ZQs2CFsTewnmfJmWn1rteQMwgPGOBMn
         HKJkVyRXJDfFdpDKnAiWCY0vbNZiMUNIYUfOtp84C+ZcTxIn41HPVa4N+p+Q2rOeXxka
         43fxT2oxyniC6q/xTt4pp6o9ISXwSueMqWoMq66dIuB7vzZJwwWiwzgUU+9xe1hcvTUp
         3QAxH5KOD1t5yLtpMWbVpJfNvxMgfE2eFdjnTZlDb3aewtoHqNdPGGdl9Vh/xSvVJVKE
         SybxrrJceYBTI6GxWhxj/HJv73Gv/1Yf1XiHfSDEExcL3RfVH+ggtnlx879fmW/LERlM
         bFiw==
X-Forwarded-Encrypted: i=1; AL+hErHZmQwjb0yzm4qQZcGw7G8VgnBIonpdg6/joyiAFFXwKNzaoY2+Lrm3DNvdITTQP9bjh7a2++ZRM/MJynPnV4WoXA==@vger.kernel.org
X-Gm-Message-State: APuU4Z+1cIcL6fDomzEQ9pXAjtBQlkP5b9ptAqe/E/t9y/Govc7aNuob
	ROovXXNQ5x4Bm9hM0Z4q7SaN/rrGfznilUZETrBRLu6Tz6e9BPF0Yvtm
X-Gm-Gg: AYBFou2kcj6zUCI6KrpfLnJaCAxBMv/Q57SKCKxaXenWwcT9adgWlTJeRPdyTp3EMSL
	q9vEm1gPo1OgUF/P0LA60YW/B2vDU61Lz/1tWmmh5cZEpRNhQDG/7XqFTRZx3MesM2Qoj0cFjIO
	6HL42Cl8EA/AKKZ2p1jlydBQQhudTWUogQuASOMGMGWhGeOdND59cEXuTtZkFLDz1wQeriDr8l+
	5aeict+O1A0kSXDq35s/p9GAp+UxjxXPUs4/11P1YaLtgnTUJKJteXAB03dqU5lh7qOgHUhxyJy
	Jc8hwQv930KYFhqCa3X02xQUBsH/YjUhh84ZHwPpjeNvoNGKtP2nu6oHgkKlScvUi1wAlmlBFIe
	NR3xGeMpL652g1DzwM+AeKaMpFyCaNFufVa/TCxFxFG5aGH20LHfO+i5nr12DLWKzTvGE78Llbc
	dsNSEekKNLyRk1d9BRy0Ne/mhgVTnrrrzY6rF4IFlmi88/Z68Ze/d1Ls2bA09BKdbqJ+HxbHWuW
	5Zm8RwZSnAxDrWKUtAqIAlSiZ62Co60UxEA3E+Vq8S8892llhhvlc35H1D/lsWp7P+C3Igsjm4O
	U6twovTcYGTnieG8L46pvyPMWsoBr1pjHH2bOCVlpwmsuOmTvq5u9eQe8EC/OWettQ==
X-Received: by 2002:a05:693c:83cb:20b0:375:388:a6d5 with SMTP id 5a478bee46e88-379675fc8fbmr2832268eec.32.1794599236582;
        Fri, 13 Nov 2026 11:47:16 -0800 (PST)
Received: from [192.168.35.9] ([218.50.238.131])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-37955a1c5c2sm10172682eec.14.2026.11.13.11.47.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Nov 2026 11:47:16 -0800 (PST)
Message-ID: <953597c5-80f6-4ee7-b8db-ec7264d99e40@gmail.com>
Date: Sat, 14 Nov 2026 04:47:09 +0900
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
Subject: Re: [PATCH v2 2/5] devfreq: Use %pe to print error pointers
 symbolically
To: Sumeet Pawnikar <sumeet4linux@gmail.com>, rafael@kernel.org,
 krzk@kernel.org, amit.kachhap@gmail.com, daniel.lezcano@kernel.org,
 thara.gopinath@gmail.com, talel@amazon.com, hayashi.kunihiko@socionext.com,
 mhiramat@kernel.org, mmayer@broadcom.com, viresh.kumar@linaro.org,
 sumitg@nvidia.com, peter.griffin@linaro.org, myungjoo.ham@samsung.com,
 kyungmin.park@samsung.com, cw00.choi@samsung.com, Frank.Li@nxp.com,
 s.hauer@pengutronix.de, matthias.bgg@gmail.com,
 angelogioacchino.delregno@collabora.com, sven@kernel.org, j@jannau.net,
 marcan@marcan.st, casey.connolly@linaro.org, sre@kernel.org,
 wens@kernel.org, t.schramm@manjaro.org
Cc: bcm-kernel-feedback-list@broadcom.com, linux-samsung-soc@vger.kernel.org,
 kernel@pengutronix.de, imx@lists.linux.dev,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260912191156.185448-1-sumeet4linux@gmail.com>
 <20260912191156.185448-3-sumeet4linux@gmail.com>
Content-Language: ko
From: Choi Chanwoo <cwchoi00@gmail.com>
In-Reply-To: <20260912191156.185448-3-sumeet4linux@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit


On 9/13/2026 4:11 AM, Sumeet Pawnikar wrote:
> Replace PTR_ERR() and %ld with %pe and pass the original pointer directly
> to dev_err(). The %pe format specifier prints a symbolic error name (e.g.
> -ENOMEM) when CONFIG_SYMBOLIC_ERRNAME is enabled, otherwise it falls back
> gracefully and prints the raw integer value. This makes messages more
> readable without any functional change.
> 
> Signed-off-by: Sumeet Pawnikar <sumeet4linux@gmail.com>
> ---
>  drivers/devfreq/imx-bus.c    | 4 ++--
>  drivers/devfreq/imx8m-ddrc.c | 3 +--
>  2 files changed, 3 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/devfreq/imx-bus.c b/drivers/devfreq/imx-bus.c
> index 49798f542d68..dba76d8b9e5a 100644
> --- a/drivers/devfreq/imx-bus.c
> +++ b/drivers/devfreq/imx-bus.c
> @@ -75,8 +75,8 @@ static int imx_bus_init_icc(struct device *dev)
>  	priv->icc_pdev = platform_device_register_data(
>  			dev, icc_driver_name, -1, NULL, 0);
>  	if (IS_ERR(priv->icc_pdev)) {
> -		dev_err(dev, "failed to register icc provider %s: %ld\n",
> -				icc_driver_name, PTR_ERR(priv->icc_pdev));
> +		dev_err(dev, "failed to register icc provider %s: %pe\n",
> +				icc_driver_name, priv->icc_pdev);
>  		return PTR_ERR(priv->icc_pdev);
>  	}
>  
> diff --git a/drivers/devfreq/imx8m-ddrc.c b/drivers/devfreq/imx8m-ddrc.c
> index 52beeb5b7d65..28d7c595fa17 100644
> --- a/drivers/devfreq/imx8m-ddrc.c
> +++ b/drivers/devfreq/imx8m-ddrc.c
> @@ -340,8 +340,7 @@ static int imx8m_ddrc_check_opps(struct device *dev)
>  	for (i = 0, freq = 0; i < opp_count; ++i, ++freq) {
>  		opp = dev_pm_opp_find_freq_ceil(dev, &freq);
>  		if (IS_ERR(opp)) {
> -			dev_err(dev, "Failed enumerating OPPs: %ld\n",
> -				PTR_ERR(opp));
> +			dev_err(dev, "Failed enumerating OPPs: %pe\n", opp);
>  			return PTR_ERR(opp);
>  		}
>  		dev_pm_opp_put(opp);

Hi,

Applied it.

Thanks

