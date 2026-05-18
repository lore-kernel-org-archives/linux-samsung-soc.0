Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1E7E3F787D
	for <linux-samsung-soc@vger.kernel.org>; Mon, 18 May 2026 11:30:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779103812; cv=none; b=UAavri6d1bHj/B7ZT29j58/LL/4nrVCVw/vd9Bykts9otdX59rD53EFFLa1hU6U1Uty7j9YP390u5peMbJ4J7xQtkjYpEhVw2y8JCtK9ogXb9deKlDgmaZ4L0MPCY2p1sbpJccfAjtv9xwbDHlPpywQkCbZyHuRvB69OfRpIUmM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779103812; c=relaxed/simple;
	bh=UHZ0whw83+z9VXkW6TAErZNmADE39pTiQfjcBIXSbTk=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:From:To:Cc:
	 References:In-Reply-To; b=QiS++HSR3UvsNlHC0BwQOepYUumWgyRY8cQiAtmO1oGDeDpAhh6Y2Oi9ekaCaevTSNxH0HMFjlQnTeub/wISnObinykNaLzSPZhmTF3RXN/qJa7gGBKTW0A7By/ZEtktVNCS/21FYsO4R3VvGJrOkz6w5LOEN+XJl8eD13p//l0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=oCySTja4; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="oCySTja4"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4891c0620bcso12510355e9.1
        for <linux-samsung-soc@vger.kernel.org>; Mon, 18 May 2026 04:30:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1779103807; x=1779708607; darn=vger.kernel.org;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UHZ0whw83+z9VXkW6TAErZNmADE39pTiQfjcBIXSbTk=;
        b=oCySTja4zyv/ptvGJvGnYt5M7a7pLXwB478QS9Iqz+4FeHGxDdotlEBY6LilD/IVlf
         UXI8lzBhq7Upw0s2LEMtjXuouB8JFAb0VWi9kDWoe8xeRYMS+ohy12eyQASe6P2y8roA
         5nSkTFGfPatN1oF5tAPgNKRs9pTiJCOZOZ3Sh1vgebe7tQLy+3MD1dgvvAgqUiYLmINg
         CoI1BviPSFv5R0dFUCErT3scs8VTNv3kqq7jM4DhCGq57QDDZSH0AlyCBKzFpo4zlZJl
         9dGJT703sVMoKjUmoXpWe9qHOdzOb94X6Ax31QVY4Dk0ygtKDo2NGmBuM7UBvos6l16i
         BzyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779103807; x=1779708607;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=UHZ0whw83+z9VXkW6TAErZNmADE39pTiQfjcBIXSbTk=;
        b=iGJw2NroLoTihHmMIdml3CJPZngnXcD/7avzOxLBx0B1R+naZu8QVYKKmyAhc4TJKZ
         hGdp7NA+UGFJjmqKGcPBSmlr8dziThi1KPFsyQUI2J0+JWxWGYJU8CP/NmVg5Zb/t+9d
         Hb7RDyDxn+zrhAkmpptS19HZbxpZb+OdfECzKZUV6GneKk2fPStMHqwBwq5R2yiZvjEA
         51QmR9GRlThXhl3tx+CHNwU4aKbqoNZ6Z9yjRv+evjZqTIMPJHiXLX3N0gyic57/lzGc
         xWO82KGNnhTgA2Tc7XlwDYnomuU8kT5BuKzlkNFD/A//3zzPZ42isJcT1pMyN1qfOBrN
         5K6g==
X-Forwarded-Encrypted: i=1; AFNElJ+VQQ09LN41rSp5b0J8XclWUiQMitgoStR5WFH1IjjzzsUpmWOFtk5szzzTtHsyHHQEVNchFxm5EeHH0i7vpTKCHQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyQIYoNVVhSj+T8p0sa/YBOGocLZECR3hhFeCnaN2R64FxK/fBB
	mSXKpfdWuSqlHs33qXNwq8sJNsOBLFEEFXSvO+kwDWHzZkaComu8ezduIHENsjJ+Adt2kLaXrJ4
	LE5Ps
X-Gm-Gg: Acq92OHeN8SlpObu7XjvzdN9xAXD4cdVx5WHJ72fWlZyZ2iL7kNB3h/0HVy9Bo2y5rs
	bE1vDu+ha/KMQN7rTdlj8sei/yhbAO23R1XT25MurcMKyC48L9ZPH69SKKOOc3Y7gkJjgbkVP+1
	uhfv8nVQ2ij8AbUOHPffr4gKrIlnAAfD8nQ+bHzqLFsVMQsLSqdpMtaoueLFTHv+IqeqMZPcr1X
	HNIMw5GY9hY+mMyRlXwanU2Av/EoWo7hJI8JFseSxQqLOxgrumMF0g1WjV1dHp3mjoH13sx516f
	eF0GMIjSN48Y9ahPGR+GJduiyTAs9s193RrpeGir4H0c8dlKEMbNudC71BmTsJB46/9HTKKYNPS
	VMKJ842E2Am/mjmcAQvqujRNqY9/PFiZv1F6yYaQeGIcdWN/7aPVobHDNREezBYm2OhtnqnxoGW
	6JSwZmZaieSasw6WIVXUTx6WKQY0nEqKOPjPeg1q4VooP5ft0EwLxjSKeDrrYZlHkiQrGY9PJmR
	RglG8WxOV+AScICSQ==
X-Received: by 2002:a05:600c:8209:b0:48a:58ae:993b with SMTP id 5b1f17b1804b1-48fe61f2a2fmr233190475e9.16.1779103807097;
        Mon, 18 May 2026 04:30:07 -0700 (PDT)
Received: from localhost ([2a00:2381:fd67:101:33b7:a835:bc95:259f])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48fe4c885d5sm228471045e9.5.2026.05.18.04.30.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 18 May 2026 04:30:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 18 May 2026 12:30:05 +0100
Message-Id: <DILRNXCXCO25.B3SAYAFHBU69@linaro.org>
Subject: Re: [PATCH 1/2] dt-bindings: firmware: google,gs101-acpm-ipc:
 document Exynos850 compatible
From: "Alexey Klimov" <alexey.klimov@linaro.org>
To: "Tudor Ambarus" <tudor.ambarus@linaro.org>, "Sam Protsenko"
 <semen.protsenko@linaro.org>, "Rob Herring" <robh@kernel.org>, "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>, "Conor Dooley" <conor+dt@kernel.org>,
 "Krzysztof Kozlowski" <krzk@kernel.org>, "Alim Akhtar"
 <alim.akhtar@samsung.com>
Cc: "Peter Griffin" <peter.griffin@linaro.org>,
 <linux-samsung-soc@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
X-Mailer: aerc 0.20.0
References: <20260513-exynos850-acpm-firmware-support-v1-0-3858d097e433@linaro.org> <20260513-exynos850-acpm-firmware-support-v1-1-3858d097e433@linaro.org> <e91496f2-3b7a-4982-992a-91e8326367be@linaro.org>
In-Reply-To: <e91496f2-3b7a-4982-992a-91e8326367be@linaro.org>

On Thu May 14, 2026 at 3:46 PM BST, Tudor Ambarus wrote:
> Hi, Alexey,
>
> Please check sashiko's review from:
> https://sashiko.dev/#/patchset/20260513-exynos850-acpm-firmware-support-v=
1-0-3858d097e433%40linaro.org
>
> does the gs101 pmic constraints apply to e850?

Thanks for the heads-up! Yes, sashiko-bot@kernel.org sends reports and
I received it. The "To:" field there includes lesser email addresses and
only device tree mail list.

I need to check pmic thingy for e850 but probably yes. Obviously, it
needs updating.

Thanks,
Alexey

