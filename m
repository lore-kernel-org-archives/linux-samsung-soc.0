Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795691039;
	b=dTdrxo/4kkghU07GFS64yiO+193AXaC7oz2S2D0cib2d2/5i1Zk2FuOYgvur+8XfzGRL
	 jhT+vT6K5K+I+Wj/CP8gqpOIcyg4q/8W/5pWhkthOQ00RulqN/N4UPjHGq35YYE2LW398
	 O0pFLUw1xfKT9QKHAsbdO0QCW+75SmEfILwMTfJ8sDNnUMfbPr1dlvbs0KCjYvgnEWb+N
	 P/Q6pDVxgUbiHN6f+UE8FD+bxFZFwxvtJmlekVn5c/Lr7T2zB5B1SxJP+5BQ47Lqlg95X
	 9QsPbsSURzbQVXZ8l6vkc/oimC2qOumeg3JcEjg3avFkVjP9Sp7rgZVwaxQx802rbsQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795691039;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=wbMl1PZXioIhutwHjgEf/QKIJdTG6ISgm88fxtlS6O8=;
	b=wanOihXj1NltQmajmH+XrQUhPPbZ0Umv6TyAENA7wsdE/dFs4wiKy3rOOWEzTgHO6VHZ
	 aGZd44I8qZwffsHgTu/CQ6DKIb8xONeDL0LISYaLwCjOpa1Tv7w6ve/NR2WyedPQliCSU
	 pvJJeYIFENKGZWPvacxWVp30JhmgR8vX20PWTQCwKHy3Hp7JXWRCUuVeaAmXfrIc6ThYM
	 qArtdrK+IgFfChJn+DWZOr3M0Trv2t8s4iMACjdyylvOEwkQMJO865sRWDVnyXwa7hFyr
	 aK0WvAAWzQRvWeaX0q5opT6cjitDugkGJWYoYAj6txOJvpcL0wHOQOf6PEs/dqLGqzA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=L4jYK993;
	arc=none smtp.remote-ip=209.85.128.47
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB450606A323
	for <linux-samsung-soc@vger.kernel.org>; Thu, 26 Nov 2026 11:03:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DB450606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=L4jYK993
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4bb69f5b161so44440925e9.0
        for <linux-samsung-soc@vger.kernel.org>; Thu, 26 Nov 2026 03:03:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1795691037; x=1796295837; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wbMl1PZXioIhutwHjgEf/QKIJdTG6ISgm88fxtlS6O8=;
        b=L4jYK993lz2ish9adws/NpZ/TcP6lz8393v5p8wEDlb0hJqFvDYDz7zq51tf/uRk/Z
         hfnSVjRNre5BdqiQXjFeSQ10XnmSqg03I81bLLP4eXRqz9wM3b2CH8ObMgWLiql3sdLK
         uxLWOf9gxnWeIGon1rxiZznEZHE3KDIfPThlK8Hs5dbviLVZJUPm8WA4RmVuVBiriZ0F
         x8V27cRrr9VYVEagZa5EBhBJrwIUCrDbjuDjP4+th4aBcjfzma6wVLaRJMd7Vm6zSpg5
         yz85qvgYT/SJ0GW9BzQgXBhOEiOFh2LuQJicjN0CDKkM3MdGsBdilkzeBiJWmOvWfZBQ
         0inQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795691037; x=1796295837;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wbMl1PZXioIhutwHjgEf/QKIJdTG6ISgm88fxtlS6O8=;
        b=UgFxL9RmPfalpe3md8IWGqzOf4/OvFO/vd1guEdxEL2eaZ2mJUg9zQEIRQK9toAsbV
         Fm3ZQB647nNExkLgBwub/S21CoVZzSCSK+TgN3+llfFqtz58fm5KDtZxX9/2FgXDuiTG
         X6vbF3waPskBLVNJYLDosWc7XnBGVml8263exVFYqmGzOXr8k7xyktsPxUXd5XgDWmtu
         hhIOekVGqoAcA/yI8mEHirMLpX2l0Lp4keiNvmB+naGr6wDNLmKPCW/UOkwGj1M5dJzg
         8tyMqXJLBU3f39eiLWxS7sLjttWcWiawf0Ia6al06vAUZo+mTQm5P3QD+aYWOJXSlq1u
         OeRQ==
X-Forwarded-Encrypted: i=1; AL+hErEIfPFj/K7WmDuRsYNJV+c4rHko+irZr2ZXTiI3SubqAPYQIik9s2ky2YOjqijVEUDLvz7g9AWq9ivrZMb3Ufx3yA==@vger.kernel.org
X-Gm-Message-State: APuU4Z+jc6IgIK7QCIJRCnFlLXQ95TeGMNTnK4a5eRieDS8V+0DYWT4c
	SvmZSbvwEYa3abG/Sr2ZYg+nZ/aXsZ9p9A5L1zv5HqvooFaFqcofouM50rVhPwF3+S0=
X-Gm-Gg: AZFdTZf1O7j/5B9y+Y59XKhXvso0O+T1vh02Z3OoaFwV0U12YJ2YsCNXnPBtA8wwnDw
	eM6ZxMQi3p6kwQfEYZqH4q3vSrIU7hjdrTEJeoCg0fMzjiP0t1akks+3AxWOLxbGt3oE8YKLy/w
	6W05Ki1VjGcjkWUY0oQN3vu5OY0BV80gGpit+RyxOYmimys1JJu03MxV1/3JCr1U82V3VGn5/q2
	C5u2Sd/aWESCeAdpib8xRuxjFSBLT9d376zY6ZTjhEK2FIA3ChVrMvBYcTtowOYFMR6WjoFqdAd
	Re2dQvhOIuliMfJ5XQUUN2vhbbiGuZeNAFIfQ5PvZPvS3U7TtCJnsa+rdXxWz5yMibqjQPrDR8q
	L5S2/2+M6kzqJhmARi5KRCNtL8mptCKDZlMQQIuU5uctxThMqnw2MR2DipWAMjQPy31WRx7zVoG
	U6W8ozT+1XpWSgHIcmORkR9s5zpP6HG+7E5Q66VnMs4lHIemildtgWWoEgcM5bDbOtV0d7waGTE
	UfiuKNDgsVlNFseM57Q26cpYRUCyTuPpsNq4dIpHwl2HMY6Xe46LKyeokCBomOtFq/sC6J1TIYa
	9VoRrsJ5Fv1sm6AIdExzhqBGy1LQcbRkm9tvm0LZk1NylKw6+Ptk64LwUVFx
X-Received: by 2002:a05:600c:848d:b0:4bb:694e:496c with SMTP id 5b1f17b1804b1-4bb88810b39mr439443445e9.22.1795691037195;
        Thu, 26 Nov 2026 03:03:57 -0800 (PST)
Received: from [10.11.12.111] ([79.115.63.240])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6a68048esm41934052f8f.29.2026.11.26.03.03.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Nov 2026 03:03:56 -0800 (PST)
Message-ID: <1e474131-3013-44eb-b675-db532d9733ec@linaro.org>
Date: Thu, 26 Nov 2026 13:03:46 +0200
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
To: Christian Loehle <christian.loehle@arm.com>,
 Alexey Klimov <alexey.klimov@linaro.org>
Cc: bzolnier@gmail.com, krzk@kernel.org, rafael@kernel.org,
 daniel.lezcano@kernel.org, lukasz.luba@arm.com,
 linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
 linux-pm@vger.kernel.org
References: <20261125173959.2198116-1-christian.loehle@arm.com>
 <CANgGJDp02H7-wLv6DoaPMeiy4UvDUC2nvSR=+mngEZ+Z4Hqgog@mail.gmail.com>
 <2162b02c-642a-446c-973e-ca80607da294@arm.com>
Content-Language: en-US
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <2162b02c-642a-446c-973e-ca80607da294@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 11/26/26 12:50 PM, Christian Loehle wrote:

>>> Program slot 7 from the lowest active hot trip so hardware throttling can
>>> precede the critical trip's system shutdown. Cache the low/high window and
>>> update the hot limit from set_trip_temp(), because the thermal core skips
>>> set_trips() when that window is unchanged.
>>
>> FWIW, Exynos850 control register for TMU has bits to enabled/disable
>> such behaviour (and it probably works).
>> Maybe gs101 also has it.
>> But it seems that cpufreq scaling feature itself is explicitly enabled.
> 
> Thanks for the hint Alexey!
> THERM_TRIP_EN is bit12 on Exynos850, clearing that on gs101 still stays on 200MHz
> for me. The downstream driver doesn't define it either.
> Clearing bit16, i.e. 0x09003 instead of 0x19003 does indeed remove the throttling
> even with all zeroes in slot7.
> I would probably still go with $SUBJECT, as I'd say the risk of this having unwanted

I prefer current patch. On GS101 the TMU control registers are owned by the
ACPM firmware, which may rewrite CONTROL (e.g. on init, tz_control or resume),
and clearing the bit would also drop the hardware throttling as a backstop,
which downstream keeps enabled.

Cheers,
ta
