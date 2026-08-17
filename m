Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D5333B42F2
	for <linux-samsung-soc@vger.kernel.org>; Mon, 17 Aug 2026 16:13:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786983203; cv=none; b=NEaFO7x2ywhaUhHp4c/aFhGWqOxJ5/4pKIh9ZFthHoJsPEELuVL9S7yR9xLSoeLZGZRYMThPAQdC23cbyOiOgsopf/vD7BbRX8WanHGKxMYIwr4jWjOZUSmyadMRK7zjaQDa37CQnLKesmbQQpc/vYAdgxzEzkgHM4SoJ8mnHKc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786983203; c=relaxed/simple;
	bh=xJefdQ0fcifSAbmN42YkvhRzBSsRE/Tok4/E/KLKe4w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=I/qzQXiXWAVEhRuflV4dMvNoZbA1IAJSY/XdZmZSQty5OiRskuHyenvJXSY1jqpDYwGUwFnMdNXm1Gwzo8R/OdamISJnfJiuIa8wI6gKlTS+dyB1enDBfqUxyY6wh5VrsD7oa7UX48ZF+shaWv6t9yeVQRZoq+szWOvuGrUhGdA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=s5d0LIZn; arc=none smtp.client-ip=209.85.215.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="s5d0LIZn"
Received: by mail-pg1-f173.google.com with SMTP id 41be03b00d2f7-ca80d708489so38149a12.1
        for <linux-samsung-soc@vger.kernel.org>; Mon, 17 Aug 2026 09:13:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786983201; x=1787588001; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xJefdQ0fcifSAbmN42YkvhRzBSsRE/Tok4/E/KLKe4w=;
        b=s5d0LIZnad2HhYJ2O2ojRrvLcvNaTKguGjr+XJQtvqMm/6iT3n0ZCo4xZurLBlwh5z
         BQUkz2S8ox/fpzR4XcFxu/17a0cJ0asKSN5JFmkkYYiBzEcl29RY7Z1EEwNLUaJfRbMk
         r5WnKJtPjlVVsLvQnA2SQJEWGpWp8a9sQCEI0iuSJpt+HUdm7yuxLmA/dXxYqwW9FDBn
         DmEeavLqEijZg8/u799xtGNtRU8w4PCRLbix+e/USDGXqi6JBAiWAW10D95gKATGEdJe
         hLiLANWmBo6CbRZCHeLu/Lym6h6KLMGPqzhJ9thnoTgRFphsXu1PaAehkDGY4V7ltyvS
         smmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786983201; x=1787588001;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=xJefdQ0fcifSAbmN42YkvhRzBSsRE/Tok4/E/KLKe4w=;
        b=LUY+t7V9VGNGH3gbGldaMu7L6ELsFLcc/gB/2HOU0fmrCN+IGLo+ulANdz5fW7aRRO
         TwuUrc8aoVSCjQY9OvMLcuXw4qDAKOYeL0ypJHVXGwSCRg9dcW0SmfcZMbKzrHlbMpJJ
         exqqksUucScoXxnGgPiaAkbB1UKNmyryiB9z6qd5isKtVHQ8h2Tb9m1mHrmIopN/ArCd
         hvkuUfHcqB2Xwh6Q23QAhgF7hcKJS6YJIizyC+KLuJrYTqcxcCR2pRZIszgsW14awU5T
         KkhrOG19B/wMspdtc0v1hhVo5Zio0CkOImH8nqMx1pxvw0aIJYoqfYSwUx+TVx+guHJ/
         r4iA==
X-Forwarded-Encrypted: i=1; AHgh+Rom0MKH0CvmoFpdWnawWA8Y95t6HB4vFL6KiBgvxUs3lEka7nVPX0nkNy6kV3+pSWWEKkJ2etJWVAEHH9UXxJliQw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxiXy/YbhjnwHpw+P/hrjGYQUUl2tnU5E7q1I9nX4eJQFG8WbU1
	BwHCfOaNF9E66b0Mp452jH1b5aUe8WKPu4MA5Cm90p2lA3yokr8gl278
X-Gm-Gg: AR+sD10Ms9TvGusuFykIHOeR6WhIMcPMD/NzScVT3OgweOdhntQu6tqVW/uz5ClrjqF
	7RsayP8gJJTQhLw5rUr6MJq6WBY2YzBMwMIe9O1LXjBXPJvbh8w1BAd+U9kEPc8NtUrUwDAWSIS
	SprzST6plu23MUWEWQ83acIYlrj0ePEf5Xp0yBEEFiVMM+dwXCiEBcU/ucljc7APvl8Cmd7mI6f
	YvK8SM9afkDpZiml+x9smHqTHrL/e1Oxt83B7Qku+Rbg1lxk8NAHx4aDestL/FMjMSOktE78yU+
	m0sBZ/y5QN/ASCTXrFfVB1ptA/RmXL6gX9+8xGG6gOjdgL5ZPtFjNHoEb6d46eqs7hIUEkfPvJD
	qL8xcyUHH+JQQJoSnfmz6/Nn2hH1j3DD3wJ64OHc/0FyVG+9AgNjb4iyoM2e7PUjv1t0YeaLCHk
	AUbTuLfYU7CjCjGrlYvL7wX/Pl//gK2xfs58x4kfAwJtcfhzESSBvtewvpo6I=
X-Received: by 2002:a17:90a:d005:b0:38e:4f42:d0d6 with SMTP id 98e67ed59e1d1-3955f1d0d60mr113069a91.12.1786983201436;
        Mon, 17 Aug 2026 09:13:21 -0700 (PDT)
Received: from ubuntu.. ([2405:201:8026:213e:faaa:24d8:b961:4887])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-32678dd22f7sm11391087eec.1.2026.08.17.09.13.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Aug 2026 09:13:20 -0700 (PDT)
From: mdshahid03@gmail.com
To: daeinki@gmail.com
Cc: airlied@gmail.com,
	alim.akhtar@samsung.com,
	dri-devel@lists.freedesktop.org,
	krzk@kernel.org,
	kyungmin.park@samsung.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-samsung-soc@vger.kernel.org,
	peter.griffin@linaro.org,
	simona@ffwll.ch,
	sw0312.kim@samsung.com
Subject: Re: [PATCH] drm/exynos: vidi: use memdup_user() instead of kmalloc() and copy_from_user()
Date: Mon, 17 Aug 2026 21:42:47 +0530
Message-ID: <20260817161247.156884-1-mdshahid03@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <CAAQKjZPwb00MePpUTmKZbn67jXp=UWX7m81evttd29L+9UcVxw@mail.gmail.com>
References: <CAAQKjZPwb00MePpUTmKZbn67jXp=UWX7m81evttd29L+9UcVxw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Inki,

Thanks for the response. I appreciate you taking the time to review the patch.

For context, a similar cleanup patch of mine was recently accepted by Greg KH and is now in linux-next.

Thanks,
Shahid

