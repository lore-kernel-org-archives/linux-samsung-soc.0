Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F03D83955C0
	for <linux-samsung-soc@vger.kernel.org>; Sun, 24 May 2026 23:02:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779663780; cv=none; b=qnrNM+pPVCTiW5ahwO3Xkc8Qpi0E03TcURb0t4CKDqkXG1OeFc6eQKVK5IQB+qAcNzkEU43hAkLIv9ojKB2s1w/Yjhm1nPzxrOytbPFQ05ktjPI/wCVUBmcfHPXomXI1FxHXvNpf7Q8V5AWeEtk5Y61MmtCwY7IbxS+vyDp/LuE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779663780; c=relaxed/simple;
	bh=MrQ5V3rA/8SexZba/BeMJRaArTuw7Njqia+jNFussIY=;
	h=Mime-Version:Content-Type:Date:Message-Id:From:To:Cc:Subject:
	 References:In-Reply-To; b=qEjtPdcfIZCw6fsSpJla2tg1VQWFVl0mCib6svpFDRDUyC8HefTBOmBjMNFI1HnGw7Jwz5eh49KQocKp/sJ28D+tB5BJhBAGn0zXlEpZlaZ/ZFXokprTx20BGdycpEo/Q+hFvg9yHWrHT7542044mb9vkUVnpPi0+AU1P5U/kyo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=nGMyouup; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="nGMyouup"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4893940bb5eso48833945e9.3
        for <linux-samsung-soc@vger.kernel.org>; Sun, 24 May 2026 16:02:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1779663777; x=1780268577; darn=vger.kernel.org;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MrQ5V3rA/8SexZba/BeMJRaArTuw7Njqia+jNFussIY=;
        b=nGMyouupbGf9VIYIdxy12dL+YrMzhJq/YR1IULpHOGMOXgV9rXX0B1Jy3KzYLhP/rB
         xeiD3RCYs3XrrE0JenehVI7p5HwIUt2hln76Fw4RBnaWGcX+SfmFPh4D37iKOowZtKlG
         9CEO6IYLNZz/HS2XjhHe7xYAQfhdoc7+pWwbbe6HjcJZDXCwD1E3HhVNkAcljZP+3ofQ
         8AGp2pZr83W0vVGlT5MmPfEeF11u/oN+BbHK0Ooedqie+fWsB/iaHVo3Dv5SueTOieu/
         PPGBzfhMnfgsdak7CzJVZs6XQeDNbomv6gB2vKKDi1dRbfSiPqH1V2E9cL1ldKYfZCfl
         Q0cA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779663777; x=1780268577;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=MrQ5V3rA/8SexZba/BeMJRaArTuw7Njqia+jNFussIY=;
        b=REoJ/1c1M1I08mRo+coQKKgzzcxI5b1cNwodZSHDd6/5ywyOCQSy8gwJdbxnkHE9yl
         /mJirxZqbrFZJTzAf6vl37WBSpetnCMqKIaanZvIdR3uBLXls1nQaSIzQyTVRPAqZeeb
         PeSl6HZYjdZkZuzguOCYieChX5S3kmFf8rLkuybm5df/Z+F2P3Ik7i8gxh9tC1U/yYmG
         tC8mm/V628z4iRYqa0k5N/10PLJU892VvCXLcF8s/mgGECSK9G7TPnejOphqLSTSWAjD
         HcSA+IytojXPT/BFMy6Ws/KEa5XZxhLH2IdcOuLhOSEihUG4y+eVB5NxEG1tOZsxY0GO
         0XwA==
X-Forwarded-Encrypted: i=1; AFNElJ/R/+r8DXNNFWgW/8czcfvIor0KdeaW2FXbEdbCCR2PWCNUJLN+OFTlfVGUkKE8nkIgRjwyoeZVdGWq5WFMjXWGtg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz8BPNQTV8/p7+AMCtIuK4tD0L5eXa92Ds0kltzeL0oyPYxFyLd
	JLFbNiWw/ZLsWBC95GihDL13llmIeqpxL+x39i6EyRI5vdEeDWVYFIxF02PDEPq/TMw=
X-Gm-Gg: Acq92OFa3OjYe6h4LOsb2gRLFKXfyQ6cor4Nx2bjRG6xXmf6nd6Mt+2PysLgdvqgegX
	CkTPA81jFuFgVNzTkyQXbCVYKKgGV1hZp5BjXBuzWWTy5x/xhDuls1TW3E12D+L59O5MG0NSwjT
	ETuC3aUlbwCq7Fi0VX1cZq8gxU3SuDveckVyvdzqAi9uMnev1qoEioXosZ6lrWYzxgaSD0rpL4y
	ICx0dtczR89rIBb3d0jLtmGlBfLNwwOi4u0ZjUnCGqJZUD+3tYEbhRlvn24C3jeQ7Z740gt+nEz
	Fv127Nl53avuqT9+OdMYwWI+FyegHCgJKkjgRqh+WdGRtOzBzSTH+rDiVH0Cah59HgbFsYzhLgE
	h20B/iZe7+fMTBdJr6/E49jA4z027sROyJiD3IAm8Gtsi0LHMC0ZQa12SiFxgYSc4L+k61g1jgR
	fGApU8+Mg7YW5ps7lmyyrxZCmrc9g1mquaVUapzHwIWFxTAB5id9Oi6cYQlciXdYJ/TUtjQ++6j
	fUHM4CWpvxBvw==
X-Received: by 2002:a05:600c:1497:b0:48a:5565:ec3d with SMTP id 5b1f17b1804b1-490428d1551mr125681675e9.22.1779663777178;
        Sun, 24 May 2026 16:02:57 -0700 (PDT)
Received: from localhost ([94.4.195.193])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490454ea134sm232108475e9.8.2026.05.24.16.02.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 24 May 2026 16:02:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 25 May 2026 00:02:55 +0100
Message-Id: <DIRA5NR89DKG.3MFIRU9TB3NHD@linaro.org>
From: "Alexey Klimov" <alexey.klimov@linaro.org>
To: "Tudor Ambarus" <tudor.ambarus@linaro.org>, "Peter Griffin"
 <peter.griffin@linaro.org>
Cc: "Krzysztof Kozlowski" <krzk@kernel.org>, "Michael Turquette"
 <mturquette@baylibre.com>, "Stephen Boyd" <sboyd@kernel.org>, "Lee Jones"
 <lee@kernel.org>, "Alim Akhtar" <alim.akhtar@samsung.com>, "Sylwester
 Nawrocki" <s.nawrocki@samsung.com>, "Chanwoo Choi" <cw00.choi@samsung.com>,
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>,
 <linux-kernel@vger.kernel.org>, <linux-samsung-soc@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-clk@vger.kernel.org>,
 <jyescas@google.com>, <kernel-team@android.com>, "Krzysztof Kozlowski"
 <krzysztof.kozlowski@oss.qualcomm.com>
Subject: Re: [PATCH 5/6] firmware: samsung: acpm: Add TMU protocol support
X-Mailer: aerc 0.21.0
References: <20260506-acpm-tmu-helpers-v1-0-a9cd5daf8355@linaro.org>
 <20260506-acpm-tmu-helpers-v1-5-a9cd5daf8355@linaro.org>
 <DIBOWQYHOPOU.3PCLCL8030WRL@linaro.org>
 <806da86b-45b7-43cc-b364-97bade8f4041@linaro.org>
 <DIFVKM72KZDI.14EVGUMQ0NV9S@linaro.org>
 <a55690fc-7727-401d-9b3c-06bf3c2852d0@linaro.org>
 <DILRJBWU9SKV.2P7EJN7ECEJB7@linaro.org>
 <73f18a2c-e729-45d7-9376-7c0e60ed35c7@linaro.org>
 <DINT2DFDVWFX.BGTG7LOC91RH@linaro.org>
 <CADrjBPqiooFC9o56bOAg-j7908ssPtrzff1reNe6eXmu7hcA=w@mail.gmail.com>
 <DIOE94AX265Y.4QU8ZF520FUV@linaro.org>
 <b061d100-c0dd-467d-8289-be2c0935791b@linaro.org>
In-Reply-To: <b061d100-c0dd-467d-8289-be2c0935791b@linaro.org>

On Thu May 21, 2026 at 3:49 PM BST, Tudor Ambarus wrote:
> Hi, Alexey,
>
> On 5/21/26 4:37 PM, Alexey Klimov wrote:
>> Peter, I agree we shouldn't bother about hypothetical SoCs. However,
>
> It's standard kernel philosophy to not add code that __might__ be useful
> later.

No idea what you mean by saying standard kernel philosophy but people
do add code that might be useful later. Some examples are:
-- ftrace subsystem;
-- commit eb2415854f3ba7d95c4f30d259f6f598ab604616
-- commit 78723fe309f189ee4010d5b7a55f6a14644a40c2
(if you so fancy about debug printk)

We can probably find more examples.

> Please consider adding that print when you submit support for
> e850.

Support for e850 was already sent:
https://lore.kernel.org/linux-samsung-soc/20260513-exynos850-acpm-firmware-=
support-v1-0-3858d097e433@linaro.org/


It doesn't matter now. Krzysztof already accepted ACPM TMU with error
conversion variant for gs101 only.
It will be nice to see ACPM that is more generic towards Exynos/Samsung
SoCs rather than gs.

BR,
Alexey.
