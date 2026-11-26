Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795708549;
	b=2gJWQlfLIaPzkeLDvZbCNq1oYPE4+3bYLLOFRjM2u3hiEQ5/LVc93bI67xINiEYCRXmq
	 JqUnDH+9cpO43Ri7nZs10Cu7d6WoNZwqt8lEihDrrzczP+x1W2YaJVYIu3krtc8BmXPI1
	 9fgpuwy+lkT2B5TfqcVOmjXEDpXBZC61zrS/+cbXCO7rqvcxwCrWomNQJ11hvDtyqmNrK
	 lwEj11igM0iAKpdBEGBQOosrRPADV6y4fFkBsrhMW+I9cEj1p4fHL/VQQZlMM9MDtMBqa
	 TRz9FG/cN5XgRskuqvlqtQkqf6Teczxqag0fVnceeYZMfs6sXScgLP1R2gt5KL7we0w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795708549;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=W7/uRx1XsGqE/NwPwsGs18nZC1l3GDgC+9VtG/a4oBI=;
	b=jzNRpNqx2ELhv2jpPtWOf8JpoTN8qynJ5IFOwvPDmE+Fb/iqUYny4X3Gk/NpCs9NzbdS
	 rlFNDab0s/+OHmJGENzrQNM7c/UnLKjcVAhX/O8vXI/WWiV7/Bof7QQ7ftP33UsdwEA9w
	 oEVUQ/a1MHJ3cv3SYx840bjY0iEHpNL6tTkw1dYH3USpOTzq13f+8UbDTuiwouPUtbHtc
	 eLPzWw1yxgzAYKmH4OnbZYBaxuJueV78gEs+YHABke4VkvlAQnxsW9LtLEzgoHXHWkQyf
	 Yo/KYHS0lxhjvRDcRYtV9DsF92ZRw5jiiFjEMBkntOvfvTxWQeFC4fUu5f506TmCqbw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b="JXoM/IjI";
	arc=none smtp.remote-ip=209.85.221.54
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7FBF606A323
	for <linux-samsung-soc@vger.kernel.org>; Thu, 26 Nov 2026 15:55:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D7FBF606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=JXoM/IjI
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-490c3ae81d3so4501934f8f.2
        for <linux-samsung-soc@vger.kernel.org>; Thu, 26 Nov 2026 07:55:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1795708547; x=1796313347; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=W7/uRx1XsGqE/NwPwsGs18nZC1l3GDgC+9VtG/a4oBI=;
        b=JXoM/IjIkFTR0wTt95IwnzlhPZS5PjgTza4kU0lPa6VpqI9uVAw5IVoVEoOU1XsH6t
         az82g+pQrpJSHgegOzxa19pKFEluidDtgxAm3BzpnRUIbZnmt8QFztw6DVsJwYgdtstq
         XLRnnuNXnRRi+Nci3Zd5db/XOmPwrHzCK2tHmZz6HTCj4H8+Zbpuu+LlYjQLR/wye9Sz
         dgmi/SA8vRmQqqPk/xeOrcIotduAdtvn7yTWjR2Xsz+6J+FzKTMCseH75u/ZmyJ8zzt+
         UhV1sTO9XV774oldLn88JZyLsQP7M9fb4S8px4O6JT7SlSISQSZU+h51vprFmP2kbEy+
         WCQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795708547; x=1796313347;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=W7/uRx1XsGqE/NwPwsGs18nZC1l3GDgC+9VtG/a4oBI=;
        b=RZ2P2PmBB17lJJs4mPudR9e/chIwZePsTOH3dlxCujfsg8xO5XgvxhTRUhE9jkFGM/
         /CUgpKDKEpgSNlD8ZBZU3NSj/pSWT5yB2lgmtYpLstQNuoZXsQpghzsRT9N6w6+MlXGv
         JbcvtVNFChAtJ9gh2zJQ92eGN0cw0Yr34HwFjOoCZD3UFtx/8bJCE8yFTTQH2GSkZ0d+
         10P4ywf6A0YnmRvtVTWrldBCbfADNmCCKDWTJGJ84wFQ+3s5PiKwpxL7t6dEyYMS97T9
         beo8zQK6+O5+M82d5uXV4x0aBvErlXL6Ym8gO72pTi6XJuat1xRIky7WtzI2gqlkaR0C
         4xGg==
X-Forwarded-Encrypted: i=1; AL+hErFMFalv2B00jysfvdYbFXEAvcKr5PYm8q3dl+lwX+0f3P+1l76xmNYWahPGhgYWKsAjB9KWSbeFOlK92YBQeswNnA==@vger.kernel.org
X-Gm-Message-State: APuU4Z9InbKmKqI0209kTW4q9hzScBnBVQRs+JOn0ThBNOC/ta8rTtEM
	FaRjTDFZYKzTlXD3XYDqoT82A55gJZg8rnUOIOijPhjMurKPVOde18Ahkd8vHlO16qo=
X-Gm-Gg: AZFdTZekgTpsZjBmTUQNA6Jhh9ViVcmYdHJ5wyOcUDZk8w49usS6P/VFhE/JqSXAKlT
	Mo0CaEUtS/sxNpERPlQMxzrFWIi+UBXETW/qDZ70Q2ZR1vc+uesm+KPct+j1avBWK2OcHcyNtwd
	bq/tCgziFk7B2684iFKeGWAEVFb9WV94GZNZcih1j+chcuHokfIV1FgoZxF/TCV/lQGREiIuk75
	g0cPzR5EoZhtUFtWtAhJoyWwISZwN3z8+DU3UsmC/nkAPqiZXIgtuW9EPPIsXOnbzA6hSQQr1sF
	G1Wjy9byJS1i8ttw4iYgztjmzmhqb/e7dvX0EvKnkGamgUqwBxF7+r+6jyDg2b2H9Zr5RLd+9dr
	s77ke0mTRjtgyDfUeYVjlDo4NyFaRpX+NkbX5AM5ZANFgiUxCp2057SN9DSYSiR2N3/vrCXhr9u
	/I/xTwF5LMi11ojfnSwhK66erD44ShZ1E+rDyFnShWNfMuNrqzSv4rgzHuhtmdJJZVMBVio/sAX
	J5C7F9CAGaOblhGVjjV/w9BibVt5+CoeVcZZ5/3u24UbEWqjelAfl+lT69pNnpNRz1ivAGOwHNS
	gaFhIOvNhwg3vcyBk7/UcLeu9FsTl6f6O7GaTQQ=
X-Received: by 2002:a05:6000:2b92:b0:4a9:cbb5:803f with SMTP id ffacd0b85a97d-4abb400a6c6mr28239649f8f.37.1795708547139;
        Thu, 26 Nov 2026 07:55:47 -0800 (PST)
Received: from [10.11.12.111] ([79.115.63.240])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab69bf6804sm40824853f8f.10.2026.11.26.07.55.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Nov 2026 07:55:46 -0800 (PST)
Message-ID: <e113453d-4ef2-447d-ab83-d5baadf2be4e@linaro.org>
Date: Thu, 26 Nov 2026 17:55:43 +0200
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
Subject: Re: [PATCHv3] thermal/drivers/samsung/acpm-tmu: Fix spurious CPU
 throttling
To: Alexey Klimov <alexey.klimov@linaro.org>,
 Christian Loehle <christian.loehle@arm.com>
Cc: bzolnier@gmail.com, krzk@kernel.org, rafael@kernel.org,
 daniel.lezcano@kernel.org, lukasz.luba@arm.com,
 linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
 linux-pm@vger.kernel.org, =?UTF-8?Q?Andr=C3=A9_Draszik?=
 <andre.draszik@linaro.org>, Peter Griffin <peter.griffin@linaro.org>,
 Juan Yescas <jyescas@google.com>
References: <20261125173959.2198116-1-christian.loehle@arm.com>
 <CANgGJDp02H7-wLv6DoaPMeiy4UvDUC2nvSR=+mngEZ+Z4Hqgog@mail.gmail.com>
 <2162b02c-642a-446c-973e-ca80607da294@arm.com>
 <CANgGJDrnH7R9aTXhH-nj710OjwNcUTfpxE7eWGSP=9a3eoUnug@mail.gmail.com>
 <4adc1712-3608-4fd7-9eba-79b129c67b77@linaro.org>
 <DN586284T46G.271ABU0A683IZ@linaro.org>
 <e329ce21-5a24-4301-9328-917d0ae4fdb1@linaro.org>
 <DN58TGCM0EUJ.2DYM0M51C78MI@linaro.org>
Content-Language: en-US
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <DN58TGCM0EUJ.2DYM0M51C78MI@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 11/26/26 5:21 PM, Alexey Klimov wrote:
> Which returns wrongs frequency for the situation described in the commit
> message and in this discussion => doesn't work?

Yes, it seems linux can't see the hardware throttle. I need to study whether
there's a notification mechanism. On a first looks GS101 lacks it.
Let's keep the hot trip as a last-resort backstop, as downstream does.

Will try to ask around, maybe we find out what the firmware does. I'll add
the topic to my todo list, but it's not something that I'll get to soon.

Cheers,
ta
