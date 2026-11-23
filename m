Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795440790;
	b=C2mcVop4q7pPxFNTyRM91GhZvC7Q6nNuLqS97T/NKOp7dQPdhKApxuSHou7dK8vTyGS8
	 1BGnAipUh799kOtBPohaQz41Gc485aX6klK8RNYfZbWLPQdm+R2sobMrY9NJu570W1mlj
	 kv7e2Xa4qN86wDTpq32qHd8PX2N80nGTHkRbCAdBvg94enbrgnAk2Ti1DiQHj39uIvCFJ
	 Vi3K+DCXu87uF7hBcE6PM5neC3S1GTdQOU8bmBiQ+iXB0jaNxUEouiuu4hGllSDU6j3ca
	 LTj/ws3yMuXXS/paIFear2nRdOhgkTiiffXx2JHm8Kh4YdoapyXkSobqkum5fEcAh6A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795440790;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=Yyfk8X7hQAsUD9G+4fe4CzUE4boCyIRsCV8/4Z21Gnc=;
	b=XW71yWj6t7wihwnYZOX5sFHncJ//0BNLxqQ5QZDLHVIOUm7JWBVPo4FE6kY/9obIzhEN
	 BG23kZ9q1GGjw3ShCcPQcZF0YEJzt6p9fbHTdH9G6ZpvWYXiCV1h+K5x0k0iPgc0L3CCD
	 my5XeXL8JD/BOMl56TG6o3EOINmb4QGw68nINtDmdJEZS5edsgda/WW2Eiu3D0S5PXSsb
	 zLNgD74xav5eC1a2Jz9G+U4pOGdWhR2Sp1AtYepwtjjhITgAvAmhVO5wxk6gsqIAukxCR
	 kgHxvxS8wzlpBcPV3OhfuirljsXYJb6oD7WF3RVtcbWxtQnh+DLjgKdoj+5kSkX0ZTA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=KwzhDLrr;
	arc=none smtp.remote-ip=209.85.218.42
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F382606A321
	for <linux-samsung-soc@vger.kernel.org>; Mon, 23 Nov 2026 13:33:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0F382606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=KwzhDLrr
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-c5188e17487so54722966b.2
        for <linux-samsung-soc@vger.kernel.org>; Mon, 23 Nov 2026 05:33:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1795440788; x=1796045588; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Yyfk8X7hQAsUD9G+4fe4CzUE4boCyIRsCV8/4Z21Gnc=;
        b=KwzhDLrrYMrYN/9iLc3BK1W5Hw/5kWfO7v8nt+f+sJFsKTl1Utb0o6LSAQuZwIR1s+
         tt5lwGKwMNdrDOq8C7yG05WzHnAREQMH/a67iCrgl7VqjOGup1YpS62k31plfLk6uhaQ
         lsxlNAxVQejQuce3fZVLmhkFdeJIU0WnMT0LTblqiA9Fb6e5bm/wxHQbfZ+rfzTBltm3
         7NqW3h+ZqSF2X+dPo9FFleSMpWAmyUqbjHRCqLl72GGPrp03dEabacwg7Omta5LIl9cO
         8B3FpHWM9E0gt+hQooV6hy3b8p2xlRbnOI9FrvB4h02ajlvKAZPc/8EMI0aTxfTqiEXS
         QELQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795440788; x=1796045588;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Yyfk8X7hQAsUD9G+4fe4CzUE4boCyIRsCV8/4Z21Gnc=;
        b=nHooNxLDjEmcquzrPidQE0OC9AVK6hxvx4vOmL34g7WxkKKx59wiTgYojwZbiOTsct
         25jNQT8WsZ4bykZuI1hQqMWJE81dWHjiD0edLpTpGA/QYX5SwftsY5XJMJKTbNMQ2DlW
         0/1OYYJgWEQDvZmGgDTkjl3tF7dDh9ul+qBvEXjteN7jub2z0M4sc8c2dfH4b5E6/+aK
         SD35M83+VqPdmkOr2elxFeWXxkbR3ry1K+ViJT0v/W1xnEykIfavyi6RVyCpgJCTlEY/
         BiOQT6lq/JESm6jWk9yW6h4cuiBooHr9OT7w8owIvBnrwq4wwOCgywyhht4NONgBj0iV
         vzMw==
X-Forwarded-Encrypted: i=1; AL+hErGjLLfAPSuI7pOMPiwZSEOin/xEJi74A0Xhi7OQe6QP75iwojjQmg1OYOdhUg0oMrl03Ib3PxDYDMnoIqjTHKgoLQ==@vger.kernel.org
X-Gm-Message-State: APuU4Z+lFKA9UN3xPwsGGXJlPyqAS60nIlni8xtl54vn2GUMu8DyVs1H
	+lrchJHV8Y2ZotlWaD35O/W1rOylCJ5aRo5dlCtRo5PPpkL8qVwioLHMGzvFpjOMdu4=
X-Gm-Gg: AZFdTZdPGB+4Xy0x1UPiOiMYVprePMJyTVLzmTcLa9AcAfJ7N4qnx2yVjg22HxSRFUS
	x9pY3LRqbjbdu098O83ZoVNn9lhz814cNC5svfvuQSfiPouNJUdSV85DFgw2mMsv+IpUfB501yZ
	Qu25Q6XKhysMYB1EsLERlqZtp6Z6qYh/TYLcxy7tRzterfUa/1YYmW5rQrMlKA1yidjU+GJfAKZ
	fNfG49StZVFO/RcuwcfbiWkSTsITog0wbAzRHTutw4el4QWk/Ss69308yfSf1qYefLyzJNgns/q
	PpH7rlX92dhYqNr5NClrGISmNSN3IDQWOTugD1CDoj7JgDkKE1qIvxUSj11IZxDZwaj4qWQrx1S
	TnxEX2h3xW9DXwp3hxBa/JobTRRr6qM6l+UOQZ+M03mEh5qAk9+9k51KmOEBGdQrXpgzJFxOs/q
	p+9DtXiXMi0EBeTpcS34OaL9Nm8yMkOgW+wv8CZ3hpMO8ZbHr9Q7z78X2EfJ+feYWWIxykz/+h4
	edR3dCSBGxBD70j7rqJaEfBlKFltL1MK37CX8WCT5cZu1dZHKc3wCkl8nbMvzSsczi5VGMt1lo4
	4xcp4PGJ8/3XBCHeQq8b0nkVLw9HOXuCTOqZmYw=
X-Received: by 2002:a17:906:a88c:b0:c29:22cf:b0f5 with SMTP id a640c23a62f3a-c513ab3ad84mr761410766b.33.1795440788381;
        Mon, 23 Nov 2026 05:33:08 -0800 (PST)
Received: from [10.11.12.111] ([79.115.63.240])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513ae68788sm407213566b.29.2026.11.23.05.33.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Nov 2026 05:33:07 -0800 (PST)
Message-ID: <c3200683-9d2c-4ab3-bc7a-d78452456bf3@linaro.org>
Date: Mon, 23 Nov 2026 15:33:04 +0200
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
Subject: Re: [PATCH] firmware: samsung: acpm: Don't use pdev after putting it
 in acpm_get_by_node()
To: shyckless@gmail.com, krzk@kernel.org, peter.griffin@linaro.org
Cc: alim.akhtar@samsung.com, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
References: <20261123-exynos-acpm-put-v1-1-447097ce7998@gmail.com>
Content-Language: en-US
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <20261123-exynos-acpm-put-v1-1-447097ce7998@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit


Reviewed-by: Tudor Ambarus <tudor.ambarus@linaro.org>
