Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F3631C07FB
	for <linux-samsung-soc@vger.kernel.org>; Fri,  3 Jan 2025 09:57:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735898260; cv=none; b=capd8V8m6PkvaPwYvDGvJppi5p4LYp3gnL047GnwwC8WwW1u8JeIU9fCPs6Kf8fP0PjEuWnsyjYWQ/na3s2sCAcpdhNH+rJA9gzArurK5rDNtU1Rdq9ni4148UqVtM8KRhFnzV5KzeE9spsVU9PDtB8DON/euH5Fm9sIiXL26nU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735898260; c=relaxed/simple;
	bh=izKsZCIP80X31FCMq7Fijc/QLFnsPmRKo8prCpu/Mxw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NYv74a0JexZEvuKTxQpO+FCR+xosUqlMHISlgucg07GZpqOy6+NpBWWYFpn3A/xnOeIPfSuzwIGmt3aJRhZj2CfrmkTONoiUUoHFctbjdA7IDOHdauOkO1oUNNv+CsaGKoKpAYdPDU39IlAu+1a6vf8C2LOasBiWqrrzFTL1APU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=pp19L792; arc=none smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="pp19L792"
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-aa68b513abcso2249491566b.0
        for <linux-samsung-soc@vger.kernel.org>; Fri, 03 Jan 2025 01:57:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1735898257; x=1736503057; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=prlV2TvU5zVcPEfYRIyZX18nmF/95tzaSDwvnloLIJU=;
        b=pp19L792RD2gAu+brPE/f7kYC18g0lNB08y871vaLHjvQoBGdrbVgM9Cx7e7FvEeTg
         GYgug6NdhK6J9G4EtLoa/3Sm2OMgAzCrNfmxJ2DmADH/5FpNjgWG8WvucSvx3SpYA75R
         HLxJM0BhyNqm0+jg+dFcizxuwcSHGqhuGo0c+hwV1rZwXfsL4+w8awAYxRdqGfrf7ZBo
         TRA9pYYEbzmaoNZteYJ5JqHGP0p8UT2yMMORc/QAjrZbAtTymPk63CmwayQsXrYMtsg7
         TxiCkAPgMJ/a1fclMcIER1ZmdeLVWP3X5a0dth9fApvHHAYh1Y4n3C940byiY8R9H8MQ
         5Xbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735898257; x=1736503057;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=prlV2TvU5zVcPEfYRIyZX18nmF/95tzaSDwvnloLIJU=;
        b=YTqwZsMoUN6zuNC0oEtLWk3B8/sXKweh20Jy1mST9W4hKnrHdNmO/E4Mkb5KbYV4xr
         uV5bTwH6dKznsZ//Xmn52o/kaTA58D69ydxBEDfL+X3klDzPFY6eU/+35BPtouJGyHQF
         0/Vmw93rZbsFKPKkkQSBCrcqZrkRuDx38a7ukFMb7GULUf1VfbfOJnMH+CtrpsK5AH5B
         llcGWAgG5rakVPNafNYjfjaOadjF/c99dk8YgcdITTZ6yOb4mFh0t8Dekue5xz2ZIbXC
         zdNsZ1oOi7h/f0Bkyf+a62A0yE9qb4KeN8dsV86qwrTiUMaeIN3ypLv15aShHoJlzw9M
         SXWA==
X-Forwarded-Encrypted: i=1; AJvYcCUd3EqA3tM1nmzE/X/CdCkXlOV/9RxRXhGQycAsdx5BSizRH0B/WiczofYyMxw+HdOuYBtXieRJuNbPZ73WM5326Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YzwEeBFMI/zYwAcVS/q5kvu45KjKufVbViMqKqqRAxQx39bHK4t
	/zKK4slJNoERXSKekHtFgh0R7bQCyO6v1wEssZGrMM1PdDz4HGRyrTZ6crDq044=
X-Gm-Gg: ASbGncuLnh+vqvZZR2hvxDUqvcIZt+ORpAVoxJ5sZrcf3xLvSYO7EieBBoAu8GZKd2k
	Y9vjwSwLXV4wFV3ImW/gR37SZKImL2uGUH45GNAZjx4pjbm65wgkb29VibokYUjsUBtHVgGNntF
	bR/UBFV6bACms+7ILjiudypy16eLNDekksh8RarRnrNKMvmTM+0dX/Bzt60aqxHKUFizyLZL9xe
	ZhLD8G0AYn2WSTgvWDgOHlD9gPlWGA2GySnznGccAn7F+52D39iP2xjie8KkGn/
X-Google-Smtp-Source: AGHT+IGyDXQ+HgPYFHz8VW5+Bs9O2MzkymXRY5w2NBWYv3oVRbFZjUuoY+qPPaOXbWoe+EmxsTm/0Q==
X-Received: by 2002:a17:907:704:b0:aac:23db:af61 with SMTP id a640c23a62f3a-aac2874937fmr4797144466b.3.1735898256883;
        Fri, 03 Jan 2025 01:57:36 -0800 (PST)
Received: from [192.168.0.14] ([188.26.61.92])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aac0eae432bsm1877719766b.88.2025.01.03.01.57.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 03 Jan 2025 01:57:36 -0800 (PST)
Message-ID: <4e97b33f-b4a5-4875-a65d-9e25bcc5a46c@linaro.org>
Date: Fri, 3 Jan 2025 09:57:34 +0000
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 1/3] dt-bindings: mailbox: add google,gs101-mbox
To: Jassi Brar <jassisinghbrar@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>,
 Alim Akhtar <alim.akhtar@samsung.com>, linux-kernel@vger.kernel.org,
 linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, andre.draszik@linaro.org,
 peter.griffin@linaro.org, kernel-team@android.com, willmcvicker@google.com,
 daniel.lezcano@linaro.org, vincent.guittot@linaro.org,
 ulf.hansson@linaro.org, arnd@arndb.de
References: <20241217-acpm-v4-upstream-mbox-v5-0-cd1d3951fe84@linaro.org>
 <20241217-acpm-v4-upstream-mbox-v5-1-cd1d3951fe84@linaro.org>
 <ec3cdfd1-df7a-466c-8581-c9546ca6b089@linaro.org>
 <CABb+yY0rBzP8JPAik5aaXp6GivQKEf++sgiMM9fTPgd_5YXT1w@mail.gmail.com>
 <eaab647a-f6f4-4562-89fa-e64daa80bdf4@linaro.org>
 <CABb+yY0AkpqC_P-3cHeuWDu-gJzxCnarsNFNQWk45+tHKrDLmg@mail.gmail.com>
Content-Language: en-US
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <CABb+yY0AkpqC_P-3cHeuWDu-gJzxCnarsNFNQWk45+tHKrDLmg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi, Jassi,

On 1/3/25 3:39 AM, Jassi Brar wrote:
>>> Looking at v6, I prefer this version... maybe modify it a bit.
>>
>> Just to summarize for the readers, in the end I chose for the
>> controllers to allow #mbox-cells = <0>; and for the clients to still use
>> the mboxes property, but just to reference the phandle to the controller:
>>         mboxes = <&ap2apm_mailbox>;
>>
> This was already supported, see drivers/mailbox/bcm2835-mailbox.c for example.

Thanks for the pointer. I was referring to the bindings patch:
https://lore.kernel.org/linux-arm-kernel/20241220-acpm-v4-upstream-mbox-v6-1-a6942806e52a@linaro.org/
> 
>> Then I updated the mailbox core to allow clients to request channels by
>> passing some args containing channel identifiers to the controllers,
>> that the controllers xlate() using their own method.
>>
> This is unnecessary.
> If you don't pass the doorbell number from DT, each channel populated
> by the driver is just a s/w construct or a 'virtual' channel. Make use
> of 'void *data'  in send_data() to specify the doorbell.
> 

I think this introduces concurrency problems if the channel identifiers
passed by 'void *data' don't match the virtual channel used for sending
the messages. Do we want to allow this?

Also, if we use 'void *data' to pass channel identifiers, the channel
checks will have to be made at send_data() time. Thus if passing wrong
channel type for example, the mailbox client will eventually get a
-ENOBUFS and a "Try increasing MBOX_TX_QUEUE_LEN" message, which I find
misleading.

Thanks,
ta
