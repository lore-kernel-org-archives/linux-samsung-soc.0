Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2D013D16EA
	for <linux-samsung-soc@vger.kernel.org>; Wed,  8 Apr 2026 14:05:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775657129; cv=none; b=lsniE6e5ojpKiX0K01YWDrG/A/BWa5vYNVON9FnfqBjyseUFg/4lsPWomFgK9oGOtH2SvyRnu7Z9pgdcpsc0+UBFczfSDhZ4zry6RzauCgyXg31oAW51gC2+HvXOZOFUIEzca8UmnG9fxCRAu1jFcybfuJEWnYGFvFCJKkVB28c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775657129; c=relaxed/simple;
	bh=q/HxfJDEIZsacxEvj6AcEnUXO0EJ6z7DmUUMEIj9M7s=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=jqVRGk40r0jOtv4cjOviRQzIsh0EAyXi1xgD72HHEJ9hHe+ixMD13Z/yJPTlwXWAXOzuY7zki34Nlr/7pGYZLDKJJE/uDy2NWnBQp71Hf9iCDqNRPP9qMabi/3w4JVeKtQLUDb3BilBXEOS7PvhTcgUZ9CmI431MmMC+iDOIE9M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=fFywtgs2; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="fFywtgs2"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-488a9033b2cso42106025e9.2
        for <linux-samsung-soc@vger.kernel.org>; Wed, 08 Apr 2026 07:05:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1775657126; x=1776261926; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=q/HxfJDEIZsacxEvj6AcEnUXO0EJ6z7DmUUMEIj9M7s=;
        b=fFywtgs28FzjFE+RY0Q7SkaL7CnP6buZjte7Vw4lYPQg3lJRuTr7vV9SGlkU+PW66w
         d68PY5ynKBkRA+7Usm7OHFvkkKXQVfUJvFwiGCQDWA4RUTIcNKg47AjWuV/CyWECxlO3
         BinEnXUqo0b4yT+b5Oyu0ARnZ7uCiZnbP7r9YLTkJMy4kZcfjM3cVq+IIGYGOxFaOKGv
         71DQzVXP9SwI3zGu7mD2TZKoyxV8+aen81uDzVX3CTcPO+AxfY+NMdcyMGEBDCBdoo+b
         BVkOoFhYepTTgok/g7tAQiNvbMHj77ImLsjhPIX1MYnKgRcF7pLkCxgcqCcS0f7l6hKh
         oVyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775657126; x=1776261926;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=q/HxfJDEIZsacxEvj6AcEnUXO0EJ6z7DmUUMEIj9M7s=;
        b=LG4AuBkkjPkJTW3LdKML09oaGfTCrbkSsQAXE1imGDDXmTgnKUFM0mDHreD16R6GVz
         7TpY4mdPqr7EQIUTy7xwixYEVAu5960ZNGGgmty6LY9tWAV0KtMtgfaFkRgXoJazcroI
         rBJGlriydIjBtl0dfta6W5S2BtL930+ngehCLX95/TzUYzG6kN6WwbewOWYwDRlzkeDy
         MO0KEAyc8Ivqe7qCYaF/gbck4Qzkl5chgUhpUtgSuyvAnGb28Ko6T2fEmqcC5vA5w8Jq
         cqAPzA4u6nDl60aWOwjeLT5u5Fp2uHDsrJ6oQR5VHWoCoPQwytnJM7ufFY98gl4Xu6T2
         h5kg==
X-Forwarded-Encrypted: i=1; AJvYcCVrZ4mHBmNFHfsTGYYmLzmziPBCuHli5HzilkJo5zBBC8eybh/Tx3yOkcYDHvvAfP9nARSsIvbO6DEUCCAx6JXOZw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwB4i4fL0ahAtyKsbtJHekTLecHXxFz9uBW+kNVOsy6tTBvznd/
	7wq3frjDKvWrJuUEgrbqDsbtnfAxw0/H+kNBZ3IFemwgokW59y2BRgCckKhPoLGajfU=
X-Gm-Gg: AeBDievsLr2Oopgful5XmVrxGRNnc8tNb6JLeaFswJ3pAMsNcZTRYnZJeBEQfwLqGON
	gvl5lbbEXax6HnrE6pYGMcnQUAQISYchWYIxYWSz1PWhwoawagt3DTXT96YgCpEQcFOxhxXhMVK
	emG/x9UQ3sA0bFNxd0QLRrAnyHJM7sQ2feY9uj82Ekg1QZ4iLTlLTuKjzELED0+VUZD2klZgfQQ
	hPew7W6zqLCZ13q88eMCLhkJWQ/31octwbWkuhK7h7DMWJ+MjvnNBpZ7NGJObiLdOX2vOaG4c/a
	lctyK/uq4fBQpIaiKiFuZsYP6lV6CMANWATaydTkHyGL6fy7IsB9FwtHMlq8aaeMeCHDUIOEs2L
	76a9nBuKkS8ASJcu/leSNhSxgxF4QlCD9zuP9J0+vrGUPWr/gqPoJEhNh516UTvRcTbKnkAV2RR
	UMrUunKj9NKQBwlRzTD+MIkU26cva1BLmFBoCq87w0O0C1POIm7wIBOwfg07gMO6J8MwnQARj97
	srbV2/XkfFax5yD0Q==
X-Received: by 2002:a05:600c:638e:b0:480:2521:4d92 with SMTP id 5b1f17b1804b1-488997b23c6mr299995865e9.24.1775657126171;
        Wed, 08 Apr 2026 07:05:26 -0700 (PDT)
Received: from localhost ([2a00:2381:fd67:101:9775:58c0:569c:bd74])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43d1e2a6f08sm61358898f8f.6.2026.04.08.07.05.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Apr 2026 07:05:25 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 08 Apr 2026 15:05:24 +0100
Message-Id: <DHNTX1T5S2UO.28SO88SS2HDOZ@linaro.org>
Cc: "Krzysztof Kozlowski" <krzk+dt@kernel.org>, "Peter Griffin"
 <peter.griffin@linaro.org>, <linux-samsung-soc@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-clk@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 0/3] Exynos850 APM-to-AP mailbox support
From: "Alexey Klimov" <alexey.klimov@linaro.org>
To: "Tudor Ambarus" <tudor.ambarus@linaro.org>, "Krzysztof Kozlowski"
 <krzk@kernel.org>, "Sylwester Nawrocki" <s.nawrocki@samsung.com>, "Chanwoo
 Choi" <cw00.choi@samsung.com>, "Alim Akhtar" <alim.akhtar@samsung.com>,
 "Sam Protsenko" <semen.protsenko@linaro.org>, "Michael Turquette"
 <mturquette@baylibre.com>, "Stephen Boyd" <sboyd@kernel.org>, "Rob Herring"
 <robh@kernel.org>, "Conor Dooley" <conor+dt@kernel.org>, "Jassi Brar"
 <jassisinghbrar@gmail.com>
X-Mailer: aerc 0.20.0
References: <20260402-exynos850-ap2apm-mailbox-v2-0-ca5ffdff99d4@linaro.org>
 <d9c714fa-988c-4b0d-b756-c6e7a40da587@linaro.org>
In-Reply-To: <d9c714fa-988c-4b0d-b756-c6e7a40da587@linaro.org>

On Thu Apr 2, 2026 at 9:45 AM BST, Tudor Ambarus wrote:
> Hi!
>
> On 4/2/26 5:20 AM, Alexey Klimov wrote:
>> This patch series introduces support for the APM-to-AP mailbox on the
>
> If AP initiates the communication and APM responds, shouldn't this be cal=
led
> AP-to-APM mailbox?

Yes, there is some inconsistency in the naming, in the downstream too.
If this has to be aligned with datasheet like in the comments to another
patch in this series, then name should be APM-to-AP or APM2AP for that
matter.

But let's keep it logical. I will rename it to ap2apm and will re-check.

Thanks,
Alexey


