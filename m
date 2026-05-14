Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDD662FD69D
	for <linux-samsung-soc@vger.kernel.org>; Thu, 14 May 2026 00:57:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778720243; cv=none; b=if9WqAOQPm4S7KxkjSWM6oMOnGnGAmUPBBwwYSuurNbMHl0oWtqNH9569lorKcX7gOW3jzNHOkm7YafwO0QpEFjdbkZCYgPqlG7T+/6sjT6lRIQzS8apDMr4kzOtPIYbYQ6l0Sa5jesgSRkGQPVYtWSc/rSwYOAN/XAV4KKf5jY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778720243; c=relaxed/simple;
	bh=bnH9lcTaB5u5WKbJiVbyCjVwMBrxc/dLDbfbtKDMc4w=;
	h=Mime-Version:Content-Type:Date:Message-Id:To:Cc:Subject:From:
	 References:In-Reply-To; b=swHI54IYnrASzSfxhsUuMY+L9sEKk1oUf04ki+h9b8yuhL+LiBfdc+KFn5H7VSUEQHu9hf0LAKcjeyqx+kBFIVG5MKNYutstvZ9dFcI9PH8xE0dvBpRYd9mXu1c2WdRqqQGfe5hREM04RCUTYDefCQElbiwntCZK/nU2eRq2IT4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=CU6o3W4Y; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="CU6o3W4Y"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-488b0e1b870so123128775e9.2
        for <linux-samsung-soc@vger.kernel.org>; Wed, 13 May 2026 17:57:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1778720240; x=1779325040; darn=vger.kernel.org;
        h=in-reply-to:references:from:subject:cc:to:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=I1QXi58qlKHlCD7Wqn6QSRPDdT06IzAWRUafTU9bmtI=;
        b=CU6o3W4Y6MOfHoJc423EUpYNZ4hFWOu/oAgX2dpW2y42FYpaZ5OAJ6UhWPNXCll6Ry
         /MQjX5KjAOyyeJ78A/MR3C6CbXWr3k3FfEKD+Tr4sMBkbh9cNSwzXh5bjXOxb5dyY+wt
         CFO+tNylyh3wD1Y2FSbMH6OcRTcEwRz7VPRcENTpGb/UUCtF6fMj+OKG932HIAAMQKyA
         EAlxDVLI2ENaawTXPPfA8frEpK/MwNGG6yLMnUGVXllvfSEUQinKC5Y2aI0juBssnK/B
         mxap7fyjGXKKWPcTTLCDxvYLSygpPAGEZ82XIce/3tlMgNlGFlnh//e5nFo1NCzcW8tT
         vl1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778720240; x=1779325040;
        h=in-reply-to:references:from:subject:cc:to:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=I1QXi58qlKHlCD7Wqn6QSRPDdT06IzAWRUafTU9bmtI=;
        b=DtBiZeFSNsqlx+lTFeUiwP0EmPLyA7A8ZkEu2uCZ10uvq3O4RgQAphnN/hk0y3vbMT
         gss891gIRpfCnzVWBNXHYKlu+8xopjtUGR1q3bMBi11zyNCaC+CIgLHAlfj5eqzfYGzz
         7lGwrm/DGdKTCU02q1Z0OGqgQpi2Ls3DaMVXADpOAJkfaCAoHbSaNoMhKY3tapPhgrFN
         wpp5VCO+rQXFgcmI3fPc2SGZWKm9G4McsvRjkw2sN0hTcIkrQc9wFh9ushHFQeWrLYWq
         hCOdHbGlMQIG2EZ11m719qa8ufDL+w76Xg5co2Jp8FiK7MTdz79yWKHGFRyEa+BV5o56
         nG8A==
X-Forwarded-Encrypted: i=1; AFNElJ+9KVmNwqyTmOL4Hb7o+bodHoyrk/FtGJG1DKZLPYO2B8Sk7wDokBBIfRUEdytN82mCeYD/+iULl1euYjYr++NOBw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz86vvQBcQZVieksdlAd/lOhPgI1yEt3wm66yivNjxSPYEZtmGy
	1qyVlkRk90rlyb7ssNVPdTGkmkee5hZvMqkbPE7rlX0roODV4QrX0bDqTDf+V6SZFKE=
X-Gm-Gg: Acq92OG1FBIH1UNbHV2fG7GwhgEM7ECcYC0F+4h4f3/luZOssauMsisJM9KLJD+CIlV
	mPGez+jjOWnOQoBeicZ4sv/fToxx+LLt0OOSbKAlxgGonyLcyaP3Rc0EqfeUCyNMm5z4poseFhE
	LTM9/gW5UJIZx9HHFM7UFxnNrQ3j793cK7ISFWDkrVeLVGFYePeRXpe0LMqCoTG8XfpAru/Kwv3
	79tnlbk0JWKSKBDlGNKiCbZS/x0sUHpP01R6KoH+0ywNLQXBDORSiXbMXGDRBh8VyGLim0VfAwH
	wEx9wWPSNLVt+Adw48PnQjjL+hV0f0LIFUUK3jLtI4QAMQDn+ZFDsorSTtSK0vEzLYMKcpcmDr1
	4AlNSS3M/C+fLHx+0t3eKzYXM2+DWUG9naorjKaWbvOE4gfl3JVM9Ox66hmTzsmWgh48FaYwaYT
	jQM3KYLazInHDaGjXS0Ic2VGc1TiW/7YW7SyJ7+wJhpY/erWXALcqgagJhq6P4CjjQD0tHgsD01
	KKgNOCx6klwZw==
X-Received: by 2002:a05:600c:3109:b0:485:46fd:7887 with SMTP id 5b1f17b1804b1-48fce9ef234mr73045015e9.13.1778720240170;
        Wed, 13 May 2026 17:57:20 -0700 (PDT)
Received: from localhost ([94.4.195.193])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48fd76911b1sm6210275e9.31.2026.05.13.17.57.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 13 May 2026 17:57:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 14 May 2026 01:57:18 +0100
Message-Id: <DIHZP941PFXU.3I5V0ITG12EDC@linaro.org>
To: "Tudor Ambarus" <tudor.ambarus@linaro.org>, "Jassi Brar"
 <jassisinghbrar@gmail.com>, "Krzysztof Kozlowski" <krzk@kernel.org>, "Alim
 Akhtar" <alim.akhtar@samsung.com>
Cc: <linux-kernel@vger.kernel.org>, <linux-samsung-soc@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH] mailbox: exynos: Drop unused register definitions
From: "Alexey Klimov" <alexey.klimov@linaro.org>
X-Mailer: aerc 0.21.0
References: <20260430-exynos-mbox-dead-def-v1-1-a69176b7d0f0@linaro.org>
In-Reply-To: <20260430-exynos-mbox-dead-def-v1-1-a69176b7d0f0@linaro.org>

On Thu Apr 30, 2026 at 12:12 PM BST, Tudor Ambarus wrote:
> Leaving these dead definitions in place hides which registers are
> actually being used by the hardware, making the driver harder to read
> and maintain. Remove them to clean up the file.
>
> Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
> ---
>  drivers/mailbox/exynos-mailbox.c | 7 -------
>  1 file changed, 7 deletions(-)

Reviewed-by: Alexey Klimov <alexey.klimov@linaro.org>
