Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795475646;
	b=UlYt4GbA7mGs4L5qG7akV1fo7NM6Cjaq0PN8t5LyvQN9xBaqdnfD3CSqHDKH+msLRivV
	 iBAQio3z9c5UXj9XULogOH0ClM+ivhHIuCsUFnMroj/jkETy7wRDe2FERGQrBoZVwk2a5
	 cVhbCZsWnqvCLEzuSNTprYx5L9rU+eyfR5y6SU2/ugt5nFBsqtmeIvRVY592f8JtaILzH
	 fdrF6MMhob/GX2qhi83BGYnRYKE+amYpdE5nsCl7DkZweT47D5zVY64qnseDOsI5gdOoP
	 NteZQo+luJkY8I02t4kIK8qCScDAwqalerSSR6gq0Clc/mR5M9AqQw5G6J2+g2sZ+0g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795475646;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=C6KwTsLrlwsaKBhMU0WaohccwmX6ZHQZDknXs0RVOoU=;
	b=hsyTsPJt1aaujTY/aeUYM3ZQ2h5QUeuifTYtz/Wr8QMXd0dB+hIw3PvWOyTcOQBA3+KO
	 Cv3TMrUsqWiOb6lf5dk7OkwrD4R82L5aQ7wxlM0B6ZyTrHsFCOrEcKOca1XYLImS+XvXR
	 Zmof2TAFUsDS78A5W2tlRv3Gm4l9lap+dx7SHzF3otZFn13SIVXEl11xKMcBL2h0ysepL
	 LsUG51iyVrognSiXA0rQ43KInqLRtV23TpSHlrHenF9hFFJgL52M5ci9tghOPDM6IEWt0
	 ss5q0iHQy+h5VzFk0dcd2y6A+SaCCS0wFoZYXeFuS6SwhLMsSS1xzCwZOiK5fdvtLRA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=cIpCEZ88;
	arc=none smtp.remote-ip=209.85.214.179
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 698B7606A334
	for <linux-samsung-soc@vger.kernel.org>; Mon, 23 Nov 2026 23:14:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 698B7606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=cIpCEZ88
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2f0426a65e0so25252635ad.3
        for <linux-samsung-soc@vger.kernel.org>; Mon, 23 Nov 2026 15:14:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795475646; x=1796080446; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=C6KwTsLrlwsaKBhMU0WaohccwmX6ZHQZDknXs0RVOoU=;
        b=cIpCEZ88w+pQmk+ulKPNTfEnMuAxP6vai3E0cBlxkiM2J/XApn/czsHdbN/aKXPTpP
         bWvDeKqOnD7/e/v0nI+KHfUJKLse1HTOLUiwbQYh3iKGbqlsAmPiyUcyKKppy3od8g5D
         OKhjK1wl3q21YovfcKjuBmTpRWD5BBncvPZNU4/nIcQUo8DsWSQJiz6d0R86DXloYb+8
         cI0W47HT8buqyOzp3R7fy88QRAPjDyIU0Mqp6RI0vXG5nhoWc+6rLInWYNmkdjywMrYc
         yyoGJqEkURA8VOIvXYIx7n6qeySHwi6sVNFmcRHwlAwJjpjFcl6qiXD5Lr25g4XeJ6ZV
         AqYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795475646; x=1796080446;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=C6KwTsLrlwsaKBhMU0WaohccwmX6ZHQZDknXs0RVOoU=;
        b=BRyoPanGCN9KdiVOtnIDznBQ0knev3mmpJaFxJQ/vDO3e7qdkpE3d7CYPO/exUifNJ
         n3cMfbH6kA+HPJGrUQaLgrTLYBI77id5IIeIlthU2letwkRAii3aNSj2t2sgyQuzxr75
         Ecxp7mEDGCbEgeUe31Llacx8iL37tKBaa20pcCUMzar/FuSHHb3t99Ygh6eVTGdsDEZZ
         u6IIDuqKnKUtQWoMjltLx/5Gmv0GTgxdadt885qIzJOIrYAgMo0gkMMbqVXWWGUCMwkz
         0EHsq7Eiuxkutn44iFunm9zNdc08Uxhe8HMFzrBfHwwGL7B6byUTQqnj1OiHrGI9nDH/
         me0w==
X-Gm-Message-State: APuU4Z+mMWtemkcX8g/r4JaWxPUmFTL3ZL4WM2Ykt5ZFpf4XNATiIDrT
	DD1FraL0aYvOuhG8do9+vXA1Za5uDEai4guqrXqG6X/NoRMDG6UCjunA
X-Gm-Gg: AZFdTZfCxfkb8ilS9jbra+mRV66SRQ1kSn4/ztvLE+yMAJ+KE9I7UG5sHmhGYPy2EjC
	f4g2N1UWTBC9wwCsm7g41qTofFzqbiKrnTbe3yApBP7o9T8YbkQXJjtcGUl0mq2awAB2tbDmTxB
	ec7pP6vfomKz6c6vpJXReMb2CPaLEY4n+NBWZwcdaRA2JYExB3cI7hIG4lEQJ8CAncKdsv6+EF9
	HQUiFwGn5SMDK1MJZjhl0ZiL+KIdNzPT7jIIW7QoRRn4uPPIshGxN+PZC6w4SzBh5p05njLStCO
	m+g/JAqGAZONoJNDqx0YJtjgqO8wM+HfT1Mo5Z7jOFWyeqNC3hAkmR1WQ7uut5fPoNFtBAEtsmN
	gEOgBZ/GgRGG6XbyBDUP3MUHiztrUOWaSV5iIlKTkntTvrH7W20cxuYEhvz4vzMK5OVEwdbFHXW
	nq0+N5QRzgyuWOaOEaNi3YkveHKz8nuylPezA4nvoGBveu2HcKSQbZcHsCZLiDv703DebKfGmeI
	CZsei3xlSiNdPKeWV4Ztm+JF9mcIQvZcSi62EIu7ZNzotZn4axsOLL70NCt42dvOKGcsL/JGZuk
	IjpVw3XXSZmotf65PfZ2YrMT3frGlSeprL3rNd8AsvqdrQD3vMekhD3wDCOm
X-Received: by 2002:a17:903:acb:b0:2f0:25ea:8fb7 with SMTP id d9443c01a7336-2f03f0c19f1mr111523555ad.3.1795475645821;
        Mon, 23 Nov 2026 15:14:05 -0800 (PST)
Received: from X870E-AORUS-MASTER.kkp-group.com ([2400:4053:d960:1a00:9970:cbea:9dbf:d448])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f03f0dc0ebsm58140215ad.33.2026.11.23.15.14.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 15:14:05 -0800 (PST)
From: Shigeaki Asai <asai.6265@gmail.com>
To: krzk@kernel.org,
	m.szyprowski@samsung.com,
	s.nawrocki@samsung.com,
	cw00.choi@samsung.com,
	peter.griffin@linaro.org,
	alim.akhtar@samsung.com,
	sboyd@kernel.org,
	bmasney+clk@redhat.com,
	jbrunet+clk@baylibre.com
Cc: linux-samsung-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH RFC 0/2] clk: samsung: exynos5: fix sub-CMU power domain attach
Date: Tue, 24 Nov 2026 08:13:53 +0900
Message-ID: <20261123231353.3288426-1-asai.6265@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <ca2615ca-7483-481f-ac9c-cf64054ec0de@kernel.org>
References: <ca2615ca-7483-481f-ac9c-cf64054ec0de@kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Post: <mailto:linux-samsung-soc@vger.kernel.org>
List-Help: <mailto:linux-samsung-soc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-samsung-soc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Sorry, I missed Marek's series. I didn't check linux-next and the
fixes-clk branch before sending.

I'm withdrawing this RFC.

Thank you for letting me know, Marek.

Shigeaki

