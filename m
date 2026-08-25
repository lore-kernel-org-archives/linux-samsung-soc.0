Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26AC92FF675
	for <linux-samsung-soc@vger.kernel.org>; Tue, 25 Aug 2026 15:50:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787673022; cv=none; b=MOt+IdZ0f/Cp6u9/iVBGzy5Xge1Hgm0gjeMMO5cap8q9LeOHmob9WlGkAplLh86yjF+/iMvgbZ/tHhcfN+qPYj+VXENzntI8XxBEenuQS8mqfCXpd3eefyyZIPXBZN8TC7ezV+JXbH1a6yuk7dcwUSOMoa1obwl1rsnpRMd2szQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787673022; c=relaxed/simple;
	bh=lbsG+1QcQGpn/6wkJpy4eTwTvVz7cjdJk+5+NrHiCj0=;
	h=Mime-Version:Content-Type:Date:Message-Id:From:To:Cc:Subject:
	 References:In-Reply-To; b=EMN4VzR4jRQN3p8BFgr896ht0Msc0Dep0g79pPr57CE5qcROyu+csmShhwHyYQvjhounTZ1y0zEul0gRiKiy6g9CPxD3r/ACjOV97ra3xWW7WwBxz4OmzPFhehefU9srrXHuHxANyBp8IICYKWLnoSQYcP/GdPCPzEJEi+Gf+jU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=jeOC5J0R; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="jeOC5J0R"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-47f3b39f2a1so3464994f8f.2
        for <linux-samsung-soc@vger.kernel.org>; Tue, 25 Aug 2026 08:50:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1787673019; x=1788277819; darn=vger.kernel.org;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=lbsG+1QcQGpn/6wkJpy4eTwTvVz7cjdJk+5+NrHiCj0=;
        b=jeOC5J0R+g0lrkmwDDOthA9FQZWAuirheoT9F7y1ysDoMShK7961wh9KNOo4WzkPtt
         CtYedIc7lYnN62lGiCFLjvq3AUApShzQV+Vve1iqo8gS13n1u0zL9XjB4rlOOZiHsx2g
         ix0Aso7uu0GE+bTPIKFilJmd6tdjFD2Hqt3DTnWTpZ1h/ua6aMg5MSieJRvEb48idOJG
         tbqxBQrQg9kVhEi6Ra/4M74GGvGB3hbB7mQ8b2XuCquSnGM6p9l35IWzmyjTBn7+ANdO
         0IRmrPB4fWncDN4Lm31J4c6QyL+V4y5YGK2tFUmaXvyQuOicyTBosBhRdbWUHFle/IYx
         aOyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787673019; x=1788277819;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lbsG+1QcQGpn/6wkJpy4eTwTvVz7cjdJk+5+NrHiCj0=;
        b=kRiTN7nS5Ie/cnLksxvEO729xtCk76QVXPdhmmWDG6Zf7R+vnH7y6axu0YobDjP5Ag
         Bbo7O+/oh0eHJHtLdmb5rB7eJHcudNytW04ZvQ29jyBiTUvVKKMHZErN/TwtLa+apwrb
         3MSTANXsenKUI6moAtAYEDjEeF575B37spRIVtereeydxKijiWzNyY1mb4Px95Ec3Vg6
         ihGr9cTz4p/o00w/5vLu0zTU0TuD6dOZd5ouHqftqkQuUPTrx2ZHL9Ngm3x52wSVSHl0
         idnRcV7meabzGrbcRxeBR7IEUkuDoh7BAi/4WhFo6aMjdajy+V7o6/oZ0oLnZukwImZn
         KsgQ==
X-Forwarded-Encrypted: i=1; AHgh+RovZCmpixwRdrvbhH0uQ4wFbZutMYWjvNINDbydY7pojzvZ73AfdA/zbaUYT9o9Qc15aOBe2nZb9BUGbcC8WCbrkQ==@vger.kernel.org
X-Gm-Message-State: AFuF++nfyaRCjm/JYrADYDcuR7yLkORcERYLLXyawOdS/twMgM5DnZSx
	7bWJOx+ZKLta2TjSk6fQ7R7sQTmVA0pJz9123CwiTAr1nGltnqGGPF3tQgL/U8z3gs0=
X-Gm-Gg: AR+sD12dJHkD17DQy3qKqXrE6UkwuUYa/f2HM6sqJ7GhgIWl9S+M6EAKZEyZTK2ytCo
	tfVHWXs+lGdu/G4GTN0fZQhSyeNFvhcZWbHUMUChoV+bjTiFASUTdyGI3GuBb5JmUZ7wVuTazpj
	O/ORRV5XccFQaR8LITE6a3YENd+OCXUKTFO+8xKAn2jLSF9YC9Vu++p1dQR0y+kE/PGVToa5oIX
	6+v0ll372VqzxmqiKhKm/5jtcnBSL1Vx0HrDpzmlRXAHZzZQclmeoMub3xDSwWpHUPPiA4q4VlN
	tyBmuDFrr9bAAU0IB7uurWQr6p9JZne4ucVopvjkJMmKKIiPzaumjkkqdQym0SqIlMeSjcIdL+C
	x9GuFILiRf3F5lAKJHrrXue1bHru9jT2FgSGvkRJgcMx8elXLqneGz5KOfHTTFLdmK+q/HD9TTQ
	y2hBuOLXFN3CQucIIBOZ84juJzQgAv/UZEyAilBvKzYLuHG01JAqjeeFsfw9ZiUMygQQtXKYt6H
	pHeJXXEKXzaz0+8ZpXCRdOjY3EimiJOLLozoWDDjjy68R1SYQKBUEgQHkI5
X-Received: by 2002:a05:6000:4685:b0:47f:8ac0:ccb4 with SMTP id ffacd0b85a97d-482e26d9adbmr43120f8f.10.1787673019285;
        Tue, 25 Aug 2026 08:50:19 -0700 (PDT)
Received: from localhost ([94.4.85.166])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-482dd853b9asm1999374f8f.1.2026.08.25.08.50.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 25 Aug 2026 08:50:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 25 Aug 2026 16:50:17 +0100
Message-Id: <DKY572QGTWSQ.3GW5FQV7JF485@linaro.org>
From: "Alexey Klimov" <alexey.klimov@linaro.org>
To: "Thomas Turner" <tturner@lineageos.org>
Cc: <krzysztof.kozlowski@oss.qualcomm.com>, <semen.protsenko@linaro.org>,
 <robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
 <peter.griffin@linaro.org>, <alim.akhtar@samsung.com>,
 <linux-arm-kernel@lists.infradead.org>,
 <linux-samsung-soc@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 0/2] Exynos850 GPU support
X-Mailer: aerc 0.21.0
References: <GVYP280MB12139AB976CA7ACF49FEB768A1A52@GVYP280MB1213.SWEP280.PROD.OUTLOOK.COM> <20260820142330.84514-1-tturner@lineageos.org>
In-Reply-To: <20260820142330.84514-1-tturner@lineageos.org>

On Thu Aug 20, 2026 at 3:23 PM BST, Thomas Turner wrote:
> Hi all,

Hi Thomas,

On the next submission, could you please also add my email
alexey.klimov@linaro.org to c/c list?
It is interesting topic.

Offtopic: I have working patches that enable cpu idle states on Exynos850
but they are not upstreameable due to PSCI (needs some argument
shift in one of the PSCI calls due to messed up MPIDRs).
If you will be interested to test/use that, please let me know.

> This is my first time sending patches to linux so apologies for
> mistakes. This series provides basic GPU support to the Exynos850
> platform, making use of the Mali G52 GPU through the panfrost driver.

Best regards,
Alexey
