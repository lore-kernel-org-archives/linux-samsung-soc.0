Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 004973D5229
	for <linux-samsung-soc@vger.kernel.org>; Wed,  8 Apr 2026 14:49:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775659767; cv=none; b=eiQcmCHBB0dGmlVuKmfztwJuf93z0mwUu4d+0BExCGymDzEoHn7jBWUf0iefhglf9n7K+Xo5ZJS9fVKn9llBktskhfrzCwdwbT2MnFg1OmETiiihlaVb3mDDiGaQ/SS+AaGo1aw7AkOktGr5K1WGEC+eLAUheYpBmEXX6PT34WY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775659767; c=relaxed/simple;
	bh=8EQsRJiGkX5iRTB/AZVv6hwVd/Kx+flU2pF6ssQXU+8=;
	h=Mime-Version:Content-Type:Date:Message-Id:To:Cc:Subject:From:
	 References:In-Reply-To; b=lqzqpJyqHae7RQ3YoMAnIMbDJlV/sfH3ALdDGvSQBIFSX5ggxtdVBjCZ3203pA7h1YXvpR3iZF8j2fB/73MJBu68THJs7EVdJyFTxl9YLqFdazxQ9mp71DEy+BNHG2Y6Qp3NwxIzHCayGUMllRSoVez0Vr6680nI2Bh1BrEWix8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=NZBqGxwQ; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="NZBqGxwQ"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-43b95e5b3afso3580600f8f.3
        for <linux-samsung-soc@vger.kernel.org>; Wed, 08 Apr 2026 07:49:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1775659764; x=1776264564; darn=vger.kernel.org;
        h=in-reply-to:references:from:subject:cc:to:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8EQsRJiGkX5iRTB/AZVv6hwVd/Kx+flU2pF6ssQXU+8=;
        b=NZBqGxwQa7Yi+HoWDlbHzdr8kfrEjy2wYzpIDKQsN5HRVoPjsOlu2cZc8JUh/RVHyO
         S153dvYOW7qj5l03qYuxav89jjBuphJwHpd5u5MD9XtDcqDKO3NklC9c5SRZzVoykN3p
         nZ28jiR28CutpJdpieCgPO6A1vsv+a0qz29eJl8EgGCZ6+mcoveySnzAZ73yDm8pqb+d
         T08qfHEHbab+TZKR6Bncnas/Z4Yi/LSSV7ajGhw7ry2/9rzdlnPLhHeFkzMR+46h99Er
         CLEG8CSlU8qtTJeNZ00DLEhH3zMOME68L7XrhFDgBkn69INy1pWnP+zUZBBysBaF5SG3
         4JPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775659764; x=1776264564;
        h=in-reply-to:references:from:subject:cc:to:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=8EQsRJiGkX5iRTB/AZVv6hwVd/Kx+flU2pF6ssQXU+8=;
        b=S4XbaFOYMS6r/bwVxX73Ompsi6GIUJu3U62UZmgWgfzomNcSukaBGuGqQEd34noWgq
         SiqQlG6YuI87WoVwiGO1JF50ocLEPg5g9QC+ahiDCUXvIOzsno0yyJKTYfaATAqd+NsL
         T53jGgNZZtn/IrCKnE8EyEOZKyVE2I1UG0lqWCCJiUVCqBahSjctX4diz1bJwa101ULw
         oCwh1Lye+g4EwGwoqQxQwZsVMSzqDKrrju0PPkjwU+ArXzD2iDevR5PqTEzGiUtqSdeK
         n9+I4P3zMRObO6g/iJG+W9Ko7X5OLOWLXC47WJEpgPbEJyut5/3miN1sz83pMKWiqdWK
         E9rg==
X-Forwarded-Encrypted: i=1; AJvYcCU4Yk9wCgDCuH5ZN3e4nw54nN1nCOT6x5TdySHY5+RWFu7qbVFTS431dEqrtPuiRTbu0ew7gyULp+73FOTYR2XQtg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzojPY2I+/KvXb34H7eFC91zgnOj1Pg7YJCcFu4KmVFhUtUbrkh
	3I12JOq9+qOJBhb9LWkGxNNNdszaxW/CUv0Kaz/IMTjSgsXrfgaCIDADFuWpHSXwLZw=
X-Gm-Gg: AeBDies8VE1esw7NVuBuqDTi4IglSnRzep3gpbDHHrGnGt+iM+fU8Ku70zJSxc/N6pu
	jpRr30AHrJbzE2f/SdA8pOuVAkrBOLxZjgFwnt/TqVjVcD2+pRv50hf/0YsPSGKRgWtTLuapfQ8
	khvaZxdHI2H7V6y4E8ZyEbI5f+x563CUmTGUIEQVEVPpcEGxjxvF9VEl2+3jweQ1mNSFhMY7VbE
	DrYlZ+myq+aycaez1IkQBknpAHNtHxyQt1StDmuljbYBeeMABqAun7JkFPA9CC/z96vLijCZOzA
	sfA6JvFnTbMawXPrEC5uK4nHCtKVsMsV/Zx2+XDYMYbsutk3MhqMdTA9WX/pl1gswzBQli4q86U
	QyPLHDAqzx96VG3zoCG3bpObf7sobW+6fZ2Ob4MbRkGamKFrqCmXdgbw8mPGqqjyYirp6nsWbt1
	kkV3QX2LOw2xtBuLfunDaRDROGlX+/hJ12zJgxKmjqY8UA1PKGeI2ProXGchBWBkreKlknwADKJ
	RAPze7VJYfRg1liKQ==
X-Received: by 2002:a05:6000:2885:b0:43d:1c21:ead4 with SMTP id ffacd0b85a97d-43d2927bc28mr30909918f8f.18.1775659764374;
        Wed, 08 Apr 2026 07:49:24 -0700 (PDT)
Received: from localhost ([2a00:2381:fd67:101:9775:58c0:569c:bd74])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43d1e4e5890sm57988952f8f.31.2026.04.08.07.49.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Apr 2026 07:49:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 08 Apr 2026 15:49:22 +0100
Message-Id: <DHNUUPQPD5DR.18P18VV0LNTI8@linaro.org>
To: "Tudor Ambarus" <tudor.ambarus@linaro.org>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>, "Daniel Lezcano"
 <daniel.lezcano@linaro.org>, "Zhang Rui" <rui.zhang@intel.com>, "Lukasz
 Luba" <lukasz.luba@arm.com>, "Rob Herring" <robh@kernel.org>, "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>, "Conor Dooley" <conor+dt@kernel.org>,
 "Krzysztof Kozlowski" <krzk@kernel.org>, "Alim Akhtar"
 <alim.akhtar@samsung.com>, "Bartlomiej Zolnierkiewicz"
 <bzolnier@gmail.com>, "Kees Cook" <kees@kernel.org>, "Gustavo A. R. Silva"
 <gustavoars@kernel.org>, "Peter Griffin" <peter.griffin@linaro.org>,
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>,
 <willmcvicker@google.com>, <jyescas@google.com>, <shin.son@samsung.com>,
 <linux-samsung-soc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-pm@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-hardening@vger.kernel.org>
Subject: Re: [PATCH v2 0/7] thermal: samsung: Add support for Google GS101
 TMU
From: "Alexey Klimov" <alexey.klimov@linaro.org>
X-Mailer: aerc 0.20.0
References: <20260119-acpm-tmu-v2-0-e02a834f04c6@linaro.org>
In-Reply-To: <20260119-acpm-tmu-v2-0-e02a834f04c6@linaro.org>

On Mon Jan 19, 2026 at 12:08 PM GMT, Tudor Ambarus wrote:
> Add support for the Thermal Management Unit (TMU) on the Google GS101
> SoC.
>
> The GS101 TMU implementation utilizes a hybrid architecture where
> management is shared between the kernel and the Alive Clock and
> Power Manager (ACPM) firmware.

Do you plan to update or work on this series? If, by some reason,
this series is postphoned I can rebase it and re-send, for example.
IIRC it needs a clean rebase as a minimial change.

I am constructing some code on top of it, so it will be nice to have
newer version that can be (re-)tested for Exynos850.

Thanks,
Alexey

[...]
