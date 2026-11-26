Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.47
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795693934;
	b=VkZEj6ypB4//YXxq8fS0nFX8AsUVyTzYTBzhTDNMtQToAebbe5jsbXbbdQMEaFkif1vr
	 gSPc26l+8xBXFOZFNy79zGGganjaTR8Vpt5EwyT0Sy7ETIUnBx1dLxRNQaxMZ7n4JqRnn
	 Jk9hsqdBCbZNrVhahrIEL/hknnHnlqD0I2r08hNUSo0TXC+9R2C7kBrOPtRCjTKVLKOGU
	 ukH610xwB+GmrcH+XAq61LVq25wgGXA0At1qK93SFpQpsQRZOHWM5V1iapLrkddTrCnVB
	 AlB+5LBe68HRzVewg0FSWkJfFJg4/u53S8mO1E3rC43KaHa2mg/6oLSQlYOCH560fMw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795693934;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=amuRKHtIxZCusSd7NYHmthsgJGB4hV/bj//XXqhJ184=;
	b=d0pjkL0o11pEdLCicmsifn8XfLj3ZLfExxWfTxgaawSQohQy7SEf+lJkU+YjmkIz/of8
	 hxkbmp0/REDtwNh3vfzZR8ocvpK3A8Gz80wPvlqD5DhxuAYJ6LMY2HUj5RQx5bjvcjw+A
	 OsCqmH6sI70Ua4FzaLl8F2G+bLKr219iuFOgyVmjvhvmGo5wnuQVgxr3C7y/tgbLIneBd
	 n/XcQ7QDWYJDX07xXNS722Eefwp9xPCTtpy1yAwT4DPiT0TwoABJNcTZx+eMOr6jzMRIw
	 k5mMH1SCFDRcUvOm6sbLD6ERjuXqG7pw3VcahHExzPK4m7cOreVVAgZRrsALYxxJNbA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.47
Received: from mail-yx1-f47.google.com (mail-yx1-f47.google.com [74.125.224.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 411C9606A31C
	for <linux-samsung-soc@vger.kernel.org>; Thu, 26 Nov 2026 11:52:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 411C9606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yx1-f47.google.com with SMTP id 956f58d0204a3-67daffde88dso4075329d50.2
        for <linux-samsung-soc@vger.kernel.org>; Thu, 26 Nov 2026 03:52:09 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795693928; cv=none;
        d=google.com; s=arc-20260327;
        b=cfHRihKXXPm5LOUwfbhEi8kV2iTIvDNZh4Tz6Qf88AyIL9ViA+pSY/F/RVoyNEci8Z
         TbwawLz52CKst7UugD4wKyDmxcMvROIJqOZh+zXv13NumB7C/drY2YT69iq22yDGWQlP
         Zc7WqGzC/jNn6Awj6EOd0Kd7gaeuOjvEam0gUEtTX2iddYE6Y3JScOOp1q4OmxrFSm84
         sW54OK5EBZlwaA28N0FgC/4J4zheWkj+B2FRhEXcUnAzNjitDo1igXkkMm10b2fwhfeB
         v4k52ClBEclWm5yYBIyn/oqQ2/6nyCVxmwRisjv7c1Hxi2s2R9KbetEu8zARqCB+eDiE
         sYRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=amuRKHtIxZCusSd7NYHmthsgJGB4hV/bj//XXqhJ184=;
        fh=tkBPZk5BeVXlEvKPOMySJECoZtnJ0RVsrNf2IKw7/k4=;
        b=o3kwUeQ3di8J7jt4kv8hG0B42jtucMELxIV9izwyoaqoV2wuwNjKb6r4sIzh4KbOfc
         Obpv2ruJIpjgLH8mBodoiezslMJbF8B6UHivFBoa4vvwJV27Kv1AdlgMDkU5EWG3aGvT
         iRPRmwun+tF8dywz+e2urSJ5i3UhodPDswZ+rBIFKBM2qaBM5W7UhC9WrY+C5T7CvddP
         BDd78CN2UHQtpI1WmQUgzs5NBinuFhA5XYgnfBlqUytRD7P+gymqOup2GC6XYGcR1owx
         ZLhfE9CT0mcwLHM7OkYEbEluoLX4wCn0NXgjbvlBeXEmSRTCviQs6w0jQD2/8rlLq6av
         fhEw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1795693928; x=1796298728; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=amuRKHtIxZCusSd7NYHmthsgJGB4hV/bj//XXqhJ184=;
        b=JT06c3QKKCr3y0yVzTg+ate4KNvDPQLtPIUqXC2lnaoO1aKE1gjCZtRZ9qI2BWd8Mm
         UishDTnalNfXIWDh1EGZLG49GSRHC8u0qeHLlJ7Vy0vED+jjnLxd5tkJBybcBu20cAUx
         6DZXprA6wHS+OYNrVjq1zI18LZH1Bt8ZJ4LJobtqfLybwWovB37LpcwGK/D833KDbW8F
         +VYBYEUbXjWAgP5hCkHBmku9c1uHOCOFZL6pNgeCtZYYsOfEhtCLPp8+LVLRfYO1BUl1
         2cQujWKHYb+8iHKafr2QX++U+cY5W/FI0QcQK+gTIAdkKTJwphsDfqYlM3HhloKhU0QU
         5l/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795693928; x=1796298728;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=amuRKHtIxZCusSd7NYHmthsgJGB4hV/bj//XXqhJ184=;
        b=xWqsHnblNpbjzrIis1uZZ9qN/7Nt5YrQEfk7IfVwYU2Obc5NXi/nJQGw8f90PpEGBE
         W6T1y/CUm3ogbj5R3UNz44ugTZIjgzFM72SPnaMQFs6xWZ6JPE7sngwmohH6QAcPx6gX
         MR7YW2Ih1yIZULxnhxA7B8lW/1e6kNELSxmk16KaatHRVOsfM2PBqGIxd/TVx6OaJ8BG
         AdzqCoS+TvDh8QJVWSUyGPoqdATCWgZSOu9OiiVvrBD0XU7YUJBNGTx83IbdGNcFwFxT
         rdENBg2EJIQV37J/EHLewWUVQMV8xuUA+mKnz3KrpIXh72rNWiwEt3NeE1ColbvReiCQ
         01Bw==
X-Forwarded-Encrypted: i=1; AL+hErE3qGGP98prJ55N4z5Ya0/jbuyi6HJA0C71LDs9O5BtiQUhz5C+m8JjzQ0mupLJiEvpnEYQ4YhJE/jyK3YOhYsHqQ==@vger.kernel.org
X-Gm-Message-State: APuU4Z8haahQ2vBAdA1hUypxbvqny5izyXY9zyAWzaGnVsSw1q/ZGcwI
	YSHygg1I72YjvevH+et2FtKTq5p9/8OLylLiZQLy5jMz/WGcr6nC8z9Tnhni10fv6HzQ41kRuQw
	cai4ZTk1V3dSETUi42ONsSrC6AbsWh8XEh/ATBXFo8VGb3D4BkCntgTA=
X-Gm-Gg: AZFdTZeWJdkVwKbSv+7Qmo8r3g8zbV5sv0+v4Y9QMwFCf6KOhWC3OznJOX4DpMrSReL
	p51ZFaA25uXT9AHxdls2ptIGe4rWv8qMcG/iegpmoxRDpmQ0efEd5m7rU9bWDgg+lmgPyTmpa+E
	mdmXi64WrXD0HIWtndkmSNL/CPhmtKw6wsw2UGOECxbqisCem37cI84881K0IUwjtT3aXdk4BAy
	SqwKR2s82yiO4eJcMo56PY+8NMdvX2vQJ1iDIIOTab/ZbQmkIWgjSM9onPrraqi91Riu8fHbn1i
	fCY9H2H9q2HejEcQP3SGp5n4IJn2mZMD0Psq/KZoruFGpzEPy9+TNU6ABVdMXTi4Q6EpCuGKZG7
	nkR1QlhXH7/nSLs8PHXv1TGmsycHB88a2QV9+qacGSJ9f+FuPiRtkrA20NRwGLQos2UZUeoSXZ6
	GvDaB8o3Jam1dv+Bn0CXSQzf9lwxr9dK6N4eZJNtrrnEt7CskDtf0B5w==
X-Received: by 2002:a05:690e:11cf:b0:67d:c7c7:f906 with SMTP id
 956f58d0204a3-67df4551fa1mr7645191d50.158.1795693928129; Thu, 26 Nov 2026
 03:52:08 -0800 (PST)
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Post: <mailto:linux-samsung-soc@vger.kernel.org>
List-Help: <mailto:linux-samsung-soc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-samsung-soc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261125173959.2198116-1-christian.loehle@arm.com>
 <CANgGJDp02H7-wLv6DoaPMeiy4UvDUC2nvSR=+mngEZ+Z4Hqgog@mail.gmail.com> <2162b02c-642a-446c-973e-ca80607da294@arm.com>
In-Reply-To: <2162b02c-642a-446c-973e-ca80607da294@arm.com>
From: Alexey Klimov <alexey.klimov@linaro.org>
Date: Thu, 26 Nov 2026 11:51:57 +0000
X-Gm-Features: Aa3M54pjtUNnZ71ASyHQ6UnEf_ksRPjhBZS8ywckgTsHxI2GyTeeeUEsLldr4BU
Message-ID: <CANgGJDrnH7R9aTXhH-nj710OjwNcUTfpxE7eWGSP=9a3eoUnug@mail.gmail.com>
Subject: Re: [PATCHv3] thermal/drivers/samsung/acpm-tmu: Fix spurious CPU throttling
To: tudor.ambarus@linaro.org
Cc: Christian Loehle <christian.loehle@arm.com>, bzolnier@gmail.com, krzk@kernel.org, 
	rafael@kernel.org, daniel.lezcano@kernel.org, lukasz.luba@arm.com, 
	linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
	linux-pm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 26 Nov 2026 at 10:50, Christian Loehle <christian.loehle@arm.com> w=
rote:
>
> On 11/26/26 09:16, Alexey Klimov wrote:
> > Hi Christian, Tudor,
> >
> > On Wed, 25 Nov 2026 at 17:40, Christian Loehle <christian.loehle@arm.co=
m> wrote:
> >>
> >> acpm_tmu_set_trips() supplies two thresholds, but the ACPM command wri=
tes
> >> all eight slots, zero-filling the rest. On GS101, slot 7 limits CPU cl=
ocks
> >> independently of its interrupt mask. Setting it to 0 C limits all thre=
e
> >> clusters to about 200 MHz while cpufreq reports the requested frequenc=
ies.
> >> This was found through trial and error while tracking EAS regressions.
> >
> > Cpufreq reports the requested frequencies =E2=80=94 are these cached va=
lues
> > being reported?
> > Or is this what the kernel gets via the ACPM call?
>
> Requested frequencies are reported. The 200MHz I only deduced from PMU co=
unters.

Tudor, your thoughts?
Is ACPM reporting an incorrect rate or are those cached values?

Thanks,
Alexey
