Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DF67472F8D
	for <linux-samsung-soc@vger.kernel.org>; Thu, 13 Aug 2026 11:52:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786621979; cv=none; b=uSx6j7EC0y3hz0UoDUPpGKdqgayWGyrSgBf2F3xmGka/jZ8/xTGlLDo6b5Ao40jmplr2YCu7W0W+3Zl6ypKz7+v56BhoZXRpOk+InvOgcDIzdmAx14//8f9Mnju0Vt73w+1pE5J4nyg3P8SLuakzny8WDZQMyjJdYYqO45KtiCc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786621979; c=relaxed/simple;
	bh=3+mL7sLw774TWm8srN2xcPDLwTpzOXiXFyMo1RJsCVg=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=kEzqU0982CiBKAo7/L3tzRRp28dJSkDDxA8kpbskE1CP9JmMpIcUugMNOcYrfJlTrtlTiUX4acSV6nhDqYQ/WMM2RAkaOjMSPruXlu95bgv+SD6qlox7r1FM/STIY3i3HpOZxnBZJpcThU8uE1LgLe03xPoKw7pPee6foKuNf04=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=k1apJ9LV; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="k1apJ9LV"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4956242332dso18377475e9.2
        for <linux-samsung-soc@vger.kernel.org>; Thu, 13 Aug 2026 04:52:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1786621974; x=1787226774; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=3+mL7sLw774TWm8srN2xcPDLwTpzOXiXFyMo1RJsCVg=;
        b=k1apJ9LV3PV3h+qr58bcA94CHzubTPuSFKv94hxj76CLTNcuE1J7AC97EynuvO2TJ5
         /foh9ocA4+OLI1jv/iPseljCcDNyHmRuNpOe3x57imNW6/FP+fj9C9egfBQ9QnEBIPbY
         MgrERFXNvIe0+ZZc0LhUA+nG9cYKv4ikbwhoyyYPzti8D6uSDLal8pS3mayJHdYktVRq
         hqAmmDyLI+98nk4zErP03mgrGZ64zvNnQ7gaahZ3sVR+zM4wXHwiCbKMstZX5/CpoehJ
         1ZtqpGwbo3v2ih0LbptVtVL6PyPXYdv3DUl+uoC6eBvjv+UH/wr9gsrSYYO3LOBV2nP4
         kcoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786621974; x=1787226774;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3+mL7sLw774TWm8srN2xcPDLwTpzOXiXFyMo1RJsCVg=;
        b=VHfzU9MGhUfn9/l3Pde/ycfWrUIycuRIbsY0e5jB4I+VuWu0v7mXL4rPZNcEPDV+bX
         XPK4DCWFaThRIxut7P9CT2ILz77jKNz3bk+ozmvOHi9YthE/ogdtkqXIrKLMnzDJzEBw
         WIGEZCqt0koQJ8tgDycnnNOzPfy84+6KYcc3Aw1pHi3vNp6M8VpuaWVrcUK7XSHuW1vJ
         4VYN2PobUasBWXuu37BXrjYgVj9EsbeDJ0LnLHiaBtY6mLFS1zel2MJ/ANM/CsblRM8l
         wD4uyQTMQkeZLEvi0ceCzg/aYvJv5Ekz/cLOfo/k1HUlUtsiSn53fauqpeGCoQKhlh2L
         sJ7Q==
X-Forwarded-Encrypted: i=1; AHgh+RoampM4WSWKfZBu7UHfBzGCjbgHuNpEQWWEtdqpMoTPC94DuPm8zCU7GObT0ctlLcBSwKE6jNBvzBB5ZxvYAS4GOQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyNe89Ck1VxeC3lnwvvf5KxU4dabq5VMZ3bselOI4JaI34I/qAp
	c4UUfpCXFPZI+EIc3bAN2Y/rd4saZ45NYzwW4Y5FabliydK6OaqdIf3BDFheq+VL5oE=
X-Gm-Gg: AR+sD11Xlan5UomHg5x/GpAcO5iPk/yznn2sztl+oExEDjPmeESbblRKOqdwHZCq/8X
	FmahNds1kVspaeP7m2UWvs39KCJ5OBSyBGf2AlGsZk14friklvAfPPG3ZaqSX6+QVGrtJl/uQU2
	fVnzMs0/T9si0QHT/TeHLhNV/iTgOQ+BjAXbYSSf+Fv0A+g+Lbz7AEKH7xOcHvaCbUL0dZW9ua0
	GSwRTFXP+Aw5ZkowzCV3YCzPXvmg4W99SSRDsyR8+kNt7x17857G5W0IW5kSDYgBB/t5ZPd9y0y
	VLUD+f7QM+cN6pGNIXPlmFAYU2V2bsOxeTfpEJD2HBuojkeQaKz+/hLmEc+4kOQJ/cGNb4JYm25
	Ob1PqOOKUix537Xt6vSfFlxElEk9d4HVXAdtwZdJB7ttI65MF6lW4VUVHbF+zxxw2gjbx3CdHKf
	t+p6/p8dB0EMNUqwc8BuifkNydxLsAi7Xrwx/34tZc0F+YZeSMIVIhNFDURD2WsDjUYjZi17hmM
	mVk9pVMEtJJPBsE5v8PznJbPO0wdob2eLVjyhxy7QgJN/BRal3cAhbNMeKLp6Og
X-Received: by 2002:a05:600c:3153:b0:499:7ce1:d8af with SMTP id 5b1f17b1804b1-4998219bd2cmr62067605e9.1.1786621973610;
        Thu, 13 Aug 2026 04:52:53 -0700 (PDT)
Received: from localhost ([2a00:2381:fd67:101:c11:afa0:9e5d:4eee])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49981b0f4afsm72097455e9.5.2026.08.13.04.52.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 13 Aug 2026 04:52:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 13 Aug 2026 12:52:52 +0100
Message-Id: <DKNSMR9KRFQH.3SQDYW46B42FV@linaro.org>
Cc: <jyescas@google.com>, <linux-kernel@vger.kernel.org>,
 <linux-samsung-soc@vger.kernel.org>, <linux-pm@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-hardening@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, "Krzysztof Kozlowski"
 <krzysztof.kozlowski@oss.qualcomm.com>, "Rob Herring" <robh@kernel.org>,
 "Krzysztof Kozlowski" <krzk+dt@kernel.org>, "Conor Dooley"
 <conor+dt@kernel.org>, "Bartlomiej Zolnierkiewicz" <bzolnier@gmail.com>,
 "Krzysztof Kozlowski" <krzk@kernel.org>, "Kees Cook" <kees@kernel.org>,
 "Gustavo A. R. Silva" <gustavoars@kernel.org>, "Peter Griffin"
 <peter.griffin@linaro.org>, =?utf-8?q?Andr=C3=A9_Draszik?=
 <andre.draszik@linaro.org>, "Alim Akhtar" <alim.akhtar@samsung.com>
Subject: Re: [PATCH v8 0/5] thermal: samsung: Add support for Google GS101
 TMU
From: "Alexey Klimov" <alexey.klimov@linaro.org>
To: "Tudor Ambarus" <tudor.ambarus@linaro.org>, "Rafael J. Wysocki"
 <rafael@kernel.org>, "Daniel Lezcano" <daniel.lezcano@kernel.org>, "Zhang
 Rui" <rui.zhang@intel.com>, "Lukasz Luba" <lukasz.luba@arm.com>
X-Mailer: aerc 0.20.0
References: <20260603-acpm-tmu-v8-0-0f1810a356e6@linaro.org>
In-Reply-To: <20260603-acpm-tmu-v8-0-0f1810a356e6@linaro.org>

Hi all,

On Wed Jun 3, 2026 at 2:00 PM BST, Tudor Ambarus wrote:
> Add support for the Thermal Management Unit (TMU) on the Google GS101
> SoC.

AFAICS there are no new comments and no updates and Tudor said he is
waiting on feedback from thermal maintainers (for 2 months now),
what's the status of this?
Apart from some required updates [1], [2], is there anything else should
be updated here?

Best regards,
Alexey

[1]: https://lore.kernel.org/linux-samsung-soc/08d7299968e14e5fc07fa4791479=
abd9a2b11c2d.camel@linaro.org/
[2]: https://lore.kernel.org/linux-samsung-soc/DJHQR4IAYPDF.2BOI33M1O4CMO@l=
inaro.org/

