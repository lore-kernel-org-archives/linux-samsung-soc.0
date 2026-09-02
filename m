Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 918314AFE39
	for <linux-samsung-soc@vger.kernel.org>; Wed,  2 Sep 2026 22:40:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788388844; cv=none; b=Vrbg6ASUuFDk7pckF9rRXkaNOkPBVRhmlDBWX12PYKy687hYzcSycqrgBw3f+GcgejjH9yVCuYk7vPKT2JE6xml9ex4nRpuCyaV7Uo8vxLOtrk+kUqvERoY8O/A7UYAoA52PTUh8baqyXcC1VnpiGHjrfvvhCf4XR6oWWgOEFB0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788388844; c=relaxed/simple;
	bh=nB9MtG/jZH/uKfPVqmTLfUSN14X89SFk7Mqq+TvM9Gs=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=RRcz/IouetHss1CO8iMeAad/AhvgwU47c0+8kT5DqcUenbTDyeWBC1F4AiYhpYwShq/3ewke/ZVzweZ01yT0eLxgXlo9hjZiDc8BNQDo8GwCvfpmmDinwzHtf6ETpv4BVH3Qc5w8HLSDRW7aRNG/nWBCwXxt7h6pcOy/qtdovOE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=DNH28the; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=P07nUBfs; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="DNH28the";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="P07nUBfs"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1788388831;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=wNcn++DDYySJZokz8/3409CMhSq8WdyhJVAopZOy+GM=;
	b=DNH28theP9j3szOJzPS22D58KI2bN0uGnCgFg4IF7ZSI31MdXGAdx4dfaEnJSx3TQdB3iJ
	lsQ0Tn8tS3WBXtfYffuyfdCcW0PQuwh8CvjE5b3PWrBrJg6ysoSGWGcm8ifV32vPwQLRuC
	fw6B2zmetL3s+VmATzpYE0yegXH8KQk=
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-654-vyGDuX38PmatbWV7QQF2HA-1; Wed, 02 Sep 2026 18:40:30 -0400
X-MC-Unique: vyGDuX38PmatbWV7QQF2HA-1
X-Mimecast-MFC-AGG-ID: vyGDuX38PmatbWV7QQF2HA_1788388830
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-938153538caso334012985a.1
        for <linux-samsung-soc@vger.kernel.org>; Wed, 02 Sep 2026 15:40:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1788388830; x=1788993630; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wNcn++DDYySJZokz8/3409CMhSq8WdyhJVAopZOy+GM=;
        b=P07nUBfsrtIYhhD0j1WxCxTzWF8oxA9ofXn2Icf/vXqosQA7TDy7hxp5SF8Jx3nbke
         XM5WSnzAh33X7/9dEISJhWMmwGNzH3LiHv78xWCNzLnnPNYpq+18LYKTZjO7HEuZroAC
         NDqdSFm0uGqTCkd4F2RUhOtbEstAC+zGsx22SbMzivgSDw8NEYInjNJx+FKQE/jY3kHV
         yw7+tY6HbzpQC9DUQMrjr10BOkuHkF9P8ATPSuNrcwsKF+lusqqCzOmLpF+7AvMCyIbB
         xiiCyP+4VMB7fhBQYi/UJEs46Zo/mWFC7cUHd45eF64BKiUXmXBp72Fcesu+eTIjxLpP
         Lb1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788388830; x=1788993630;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wNcn++DDYySJZokz8/3409CMhSq8WdyhJVAopZOy+GM=;
        b=qo/NYVIruvAIJPGTTZlgnXzmeDYOh/E6US4KmSAu+yedx52jAJRDR+5A5M2d2eI35R
         WymOKEX5Q34CvueoY7yFCwuFtO1+umEclvFBltKpsXbSbeSKYaWNtcPRn1uosHW7ARFN
         r4hsyCdTPz9mz4FdrYsdhcp5LToRHDInJmutcrOs9iD4Rz8Mxp64LINqRUcT4ZwsayWm
         cM1fnWH558iVXHN8p3FvBfLPm6//HRK/a2pFu27thvTkl1gw6hT0Ne1Ljoo9gfn8HMFw
         8k9xWDZSXzBCPq4NHL+wGXKuUzoHcxDUN881qOYUWwEnEtMCUqwRgszRsiYRZHias7Bu
         696Q==
X-Forwarded-Encrypted: i=1; AKwUvBzooODAyfO5S3MLidC15JO/bTK63VHmicQVkgE4LFfZt+1oQR9n+TtUgbyhY6b9OvoKp3qvx4xwVHiKQ1LydvlkgA==@vger.kernel.org
X-Gm-Message-State: AFuF++nr26BlEz2auhMXQdOJMjfqL+FP/v/qYCTzQfEw71zRBFDayu0L
	K/GBxkZFxJwDQa0UQx8dOE/WRnpHlEOXzr5iB25NXmZnij0Sk4N9SkHYwcYjANtTTKHjM+n11rH
	QzCSWBDNSX3LPGzi0lVSDUpEjbrJkL5D0e/Zy+NhBd0F3zI9PYIGVi/Z/OBiRyh2dYX4T54+p
X-Gm-Gg: AYBFou3u+WQ03pnapfjB73CEAGgqd28BHLLE6iXXQBK4qs9xtUSfvDDrN2mQHu8wYZB
	JrmGumrSD+Xd+SxzLy9JyIX7NbxYrI90mQPYbNNnHGxow7/LE1t/Ov95C+cII/Mi/CamA4V0nMp
	2ic+qJaQ7Oqyqf5MOsHIwprzJx3v0CB58cVZ2K4JXTbhWeh5huvdrnlDkOhu1OnxJK3WPzSZQqf
	nKJhAK576WGLDRSSBrg5kJ26JindrkIdgSsKy9uEWjzn+RCvn3MwuFXZzPFS3qVRTk/uPXwsGJq
	CRcvf53/wYUK7ijsNcsgS3Tej/GH8HS29ui9qGS8Twg1oQW/rTqHXyW2+GS4VRbKq9a6OHlbuxI
	sOg==
X-Received: by 2002:a05:620a:5ee1:b0:939:6de9:4cff with SMTP id af79cd13be357-9396de96ebbmr234855685a.45.1788388830012;
        Wed, 02 Sep 2026 15:40:30 -0700 (PDT)
X-Received: by 2002:a05:620a:5ee1:b0:939:6de9:4cff with SMTP id af79cd13be357-9396de96ebbmr234852385a.45.1788388829633;
        Wed, 02 Sep 2026 15:40:29 -0700 (PDT)
Received: from [10.239.101.46] ([69.43.42.202])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9395f157ec6sm325731685a.7.2026.09.02.15.40.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 15:40:29 -0700 (PDT)
From: Brian Masney <bmasney@redhat.com>
To: mturquette@baylibre.com, Triet Hoang <triet.hoang.dev@gmail.com>
Cc: sboyd@kernel.org, luca.ceresoli@bootlin.com, krzk@kernel.org, 
 s.nawrocki@samsung.com, cw00.choi@samsung.com, peter.griffin@linaro.org, 
 alim.akhtar@samsung.com, michal.simek@amd.com, shubhrajyoti.datta@amd.com, 
 linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org
In-Reply-To: <20260820065904.2032536-1-triet.hoang.dev@gmail.com>
References: <20260820065904.2032536-1-triet.hoang.dev@gmail.com>
Subject: Re: [PATCH] drivers/clk: Convert to DEFINE_SIMPLE_DEV_PM_OPS()
Message-Id: <178838882032.2062832.5940694093369397743.b4-ty@b4>
Date: Wed, 02 Sep 2026 18:40:20 -0400
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=303; i=bmasney@redhat.com;
 s=20250903; h=from:subject:message-id;
 bh=zL0boMPnZXSvjvuLkbS1bHkmEeflCn7eOnBIJo/+CW4=;
 b=owGbwMvMwCW2/dJd9di6A+2Mp9WSGLJmLL0VV+h7R0zPm9dX9HPSGX61EsfIdw9vtRTN/i5/t
 j/WaLZpRykLgxgXg6yYIsuSXKOCiNRVtvfuaLLAzGFlAhnCwMUpABMJW8fIsH36qdUPmP4Wzj0q
 rGyUEmQd/uuT83qbiGs/py98ZH52/wlGhteCFQ9jr3uHZX69fKc99RrbBgm9fRUeH5YsUXdtrLG
 6xA4A
X-Developer-Key: i=bmasney@redhat.com; a=openpgp;
 fpr=A46D32705865AA3DDEDC2904B7D2DD275D7EC087


On Thu, 20 Aug 2026 13:59:04 +0700, Triet Hoang wrote:
> drivers/clk: Convert to DEFINE_SIMPLE_DEV_PM_OPS()

Applied, thanks!

[1/1] drivers/clk: Convert to DEFINE_SIMPLE_DEV_PM_OPS()
      commit: 48bec6fd8ec32ffdf65a5ccf268428a9f79ea210

Best regards,
-- 
Brian Masney <bmasney@redhat.com>

