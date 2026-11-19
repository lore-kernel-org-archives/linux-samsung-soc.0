Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795096126;
	b=V9DEzxiNlq9rr3LVpS5hrweAOjnoAfYMVV/RbUXh6y1xabd/Pvh9QO5165sCD0Aw0TM4
	 0IxMFH9INh9E8nk9vVSOJPRm9ahIz3dOGstEhGt3OPcrc6Sbi7M9te8t/fVcer10BnoPw
	 qRULkPwfiDsVJP7nlO8jWn/Q8eozh1kH2LJe1ZWzuvcZUWaWrR8rViM0++XtA1eIvlSqf
	 UMZprA8MNS6QJLIhZlGrJ4+k+uRFM9EhZg+WbPrlyXVnjyYei6sgriVIstybfiEkc9xvQ
	 b65t4sr89wtxu4QqD72U1R3SD3nbQnJKXL5JdPo0S6aOD+7cKmIMo6avjF1Y49iJxcA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795096126;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=BKa5IC7AB3kLyLATonakZgU4RKoDnILa/q6mHie7Xw0=;
	b=TWEY8f8BhAF2iQTMP/DdeGL29chVcICJxYmGtL8CqPOqTqVtVguiTp/KjjCgjtg6bsrX
	 B9Tha2zTkTQL4BA64QtnkDAYCrLwcKG9/1S2Sgmr6bcklcbW97UnN1EZ7jyjrDa/2qeX9
	 MSVSfWbC3r2SdMWrByEZADSfB1p1Cdy0z1Bkg7hhtI7T9Alz8v99txYbo3wztSGwArP2z
	 d1koyFYCjiop7PqPKmjoMbxLjYkslbjhT7B7eTgn7e+MihF1xka3AaKnl5f6xQCeXGEAj
	 Q2glg907dLEp2WTXeaLE4zbSacifJWmPfP5P8j9qfLv9ofyv+J9sdngRUlon4A4srZA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=fL93sBph;
	arc=none smtp.remote-ip=209.85.221.50
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E832C606A326
	for <linux-samsung-soc@vger.kernel.org>; Thu, 19 Nov 2026 13:48:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E832C606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=fL93sBph
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-4a34ffd3e39so1265453f8f.0
        for <linux-samsung-soc@vger.kernel.org>; Thu, 19 Nov 2026 05:48:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1795096124; x=1795700924; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BKa5IC7AB3kLyLATonakZgU4RKoDnILa/q6mHie7Xw0=;
        b=fL93sBphOCi0c4Cbb9loeHvf7xl9+2wRsGNd1Zkk7WfkZbs7Br+PFcCik+0Qzose8F
         wlV1I5nH3tgPGkQAjg5duPXqhqd9s6Z5vPkS70cjUl95yVpMfiZITXE70sOC05uR4Y2+
         9HpGfjPiT/IOS9gSLXjBLURHQaAqef92Op4wStEFvcmhJKQgepquUQVW1Q2AKUpo3Mv3
         ohdXw1wJRFURvNCMejSS4JWuDBgXTp64OvouZBOVWfNP2jUmu70SzRI+wCopIcp0jEBv
         NSdAW4mQQSZzeFSQ1B8E12+Rqrv7aFHAscPvQtj7FYHoLcuw9DKHXHW3KGGuveUZ84Ms
         JVkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795096124; x=1795700924;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BKa5IC7AB3kLyLATonakZgU4RKoDnILa/q6mHie7Xw0=;
        b=duuNYkjCro3KxVW/HxHMXuW6apJE+FBgM6bwZjO7bBLAPtZiOeaszqcD26NvZEIJil
         N83IC9Jj/9subVv+jBxu81nSZRoxNRMTB94REHwsd/hL85Z8vu1rjo3s3McLYC5Pf7mi
         HYxKdlD/Erx290pRcVVvy/555UouT2FLZZqIxP60+ESkMhCQptksTEQRZJQKirfPJ4Ts
         LpSs1bcRwUD94vgb1CuFx7KpHUQfzBruyPy0YtGvCDtwUsgX0zikreLgx+0ypn/EMRNW
         g+MRwTuDpAUpmqU/VL39qxcDhAVRQlQravp888RA0KhaFmhLQfl/4y5C+yj4s/lg+qe5
         qQUA==
X-Forwarded-Encrypted: i=1; AL+hErEclZFjnezuBCJ4epYzUlgFggeGX8GOv7lvHxcRYKpDy81SsD+MMo9yoN42zhUIqZDlhKAO3illM5C2aroXyQtH2w==@vger.kernel.org
X-Gm-Message-State: APuU4Z9rRDqj7vC0oxSk3RM/aOfPlnORGjuLGP6NgVkfYTYWvRSIjUYn
	Jk6CvOeC00EHTMJX7XRkvLoWJ4lbeZ5deGnXy9LYLIJPog5ASsRgNiSgZEHrR5Fb64k=
X-Gm-Gg: AZFdTZcAHc2+HVwr3hgMinaiMsiyoW0IpRUMPns4wbkrT2GD2H2Bs/I0FDKLwTL7lm9
	OIcULQoWdyEWrZ8z4CnLfU1nNTONjiIMY1amrLOVhbJxkod0bkoAMy+0BEYWJcpPD4dpGmv3c5q
	3mtPG5cTncXiI5RLUjXSAfo9uF9+QwgKDQ8vLXam4ka4fhblMatse7a35YKzgT1Jt9rtHlmWWeu
	A1EX7miE/tWExZ0+vdm3fxko70v/TNBNbzj1g7AD3TterZTFVDZxFWyJKSJy3yvD1EdyDn1tu8V
	l8Em/7lFnl2YI6G42gA7cTIow06A1XgB3S+GlPsuaNQhKjmzk9TWKHvJAtYxdzxXrvfNlwH4eKB
	bfEt1ci/jh1iCgMrek9VxG8mBcNGNJGyWTi1nu3ATZe67hyUySXGYe3/NUhaMVLsR8kJo94xKMa
	09TF9yvpTpg6Y1yUqjFXNq+NktCLfwTLBNaGFBGTm970G3l0lrMPMO0bTh3pyUZmm6Qnn4pp9FZ
	zJApOUdD6Jpl0tOVzGFk5gfTwx68a2FXtv9IxKtxTJN1Y5Yh9JEyeYFVQ/t3v1py1AGxj5/m9Nb
	ICfIEyOS+wLzQUe8c395S/S9RemShvCU+rh3eBOn
X-Received: by 2002:a05:6000:613:b0:4a7:45a2:ec26 with SMTP id ffacd0b85a97d-4a745a2ed63mr12002121f8f.16.1795096124130;
        Thu, 19 Nov 2026 05:48:44 -0800 (PST)
Received: from [192.168.0.252] ([79.115.63.210])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4a65609391bsm10932012f8f.36.2026.11.19.05.48.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Nov 2026 05:48:43 -0800 (PST)
Message-ID: <96fb6324-7563-4d0d-88d8-cba55b92eebf@linaro.org>
Date: Thu, 19 Nov 2026 15:48:42 +0200
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
Subject: Re: [PATCH] thermal: samsung: acpm-tmu: Fix spurious CPU throttling
To: Christian Loehle <christian.loehle@arm.com>, bzolnier@gmail.com,
 Daniel Lezcano <daniel.lezcano@kernel.org>
Cc: krzk@kernel.org, rafael@kernel.org, lukasz.luba@arm.com,
 linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
 linux-pm@vger.kernel.org, Juan Yescas <jyescas@google.com>
References: <20261117083442.830549-1-christian.loehle@arm.com>
 <3ea5d94b-6913-4534-816a-3935c689225b@linaro.org>
 <56a7a762-7667-4186-973c-ca0fcb399ecc@arm.com>
 <b2b0ddc6-964f-4d8d-86d4-a0bc24d9022e@arm.com>
 <4d51fe5f-d233-44d4-a50e-ef168b6f0402@linaro.org>
 <2cc6efc8-db35-4b40-ab71-815f08ed9dc9@linaro.org>
 <a1c4e409-2d73-4689-b136-41825ee2b61b@arm.com>
Content-Language: en-US
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <a1c4e409-2d73-4689-b136-41825ee2b61b@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 11/19/26 3:24 PM, Christian Loehle wrote:

> The alternative is of course to just hardcode slot 7, downstream uses 115C
> as a default value (supplied by DT trip point 'hot'). Or do that as a fix and

I thought about this too. The problem with it is that we ignore the DT value,
and downstream relies on the DT value too.

> then follow-up with a proper wire-up? What do you prefer?

I have no preference. DT was queued for next, so nothing enables the driver
in v7.4. Maybe that's why Daniel queued the other fixes for next too ...

Cheers,
ta
