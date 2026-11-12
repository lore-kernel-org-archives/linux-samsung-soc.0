Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794482828;
	b=brfcWLOnNafDyaM9eJVMx1ZCb+KVvnE+ZUBbexNuP3W9Gd1tbfGz2PIerW/hJT8p36fz
	 xN0EN7PpU5vUVMvPk0KDurmykcU89h5bhil3tlYZnSHL6Y1ODbaRwOr+v2tk20HpvsBqe
	 mOYcsSr9Lblj4mKcqiUHeqHQBAbdTEhdCOvyQywv65QqLyEEtLGYUvAfNO0jytxENypHv
	 MTb0x36C0LTPAFSxN3THRJtb5quxYAw+mtQEr+Gonq+7YDjAqYRVJBE6RK4ZmL9ggyWuR
	 N0Eou5HKOuZraNsJnriah0uF2aU5gcxa/RZ0lghtQffwFJcVI6i/0XDnZq1sgy8FEQQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794482828;
	h=Received:DKIM-Signature:From:To:Cc:In-Reply-To:References:Subject:
	 Message-Id:Date:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-Mailer;
	bh=/oEd/Rx7z61vzKiE7TrZNxTBqcUG5YHAydriCm6gOsA=;
	b=YJ/5suQM07rHT8wPqZIONMP711HRGs3D0P6wY8sP/QxFwsxHGgZJLffDGpGfRZOCmkdA
	 otqS771HNPTf08S74utQJ0W2FRnhejmhsNGYtf7DpJri0skiK11E7nty5JIucMHwPxjaK
	 T3bFtlWLYwJyizorO9AIIMV29DlwvpR5eK9ylQLGjEOI8xGaOmEnGdGH2M9lqN1d9ki3i
	 mWC9aZS5E/q0fGelTeRT28LOyXGArCaKvg7aLZYB7cKN+ziTH5e/07Sz67gW2jLC/b8He
	 3NpxDrTtydRG3Avok0/kxR/NIS+Frb6wDcm4QaX1eWE1tuT4Z1OkZiuqU9m3EBIwxUQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=lHOIVamz;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14E81606B349
	for <linux-samsung-soc@vger.kernel.org>; Thu, 12 Nov 2026 11:27:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=lHOIVamz
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D0C691F00A05;
	Thu, 12 Nov 2026 11:27:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794482827;
	bh=/oEd/Rx7z61vzKiE7TrZNxTBqcUG5YHAydriCm6gOsA=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=lHOIVamzl2HbE2kYl6t1Hi/fSLUIo5a5kdanxjhNZXwjar2Q3xFo7LP69tPoT8FoD
	 j3Y3zsgNV1Jrkd7xcKNNC6Vfkn0Z29wjdb5h9pWjXgfitk6gJN8htyOqX1zzwLe+/J
	 wuosM1b5oWfzkAUTuE1V6kVtPrCwuQBQ13KgRfWML/k7R5dVS3We3zNdiG0T8g79yr
	 OPYcLErMrgOspm9X5kpCjyRxXvaRlc6nQDmtfSgFnKEp7KQdSMuXRLjORLaDscXkBc
	 1jOye5p9Bi+6AkJ+pQkHJCGING5VpDMNYsGIO3YysGk5RHxqYg+acjTmdQm+x7dwD8
	 TuBDhhUIRDN7Q==
From: Vinod Koul <vkoul@kernel.org>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Manivannan Sadhasivam <mani@kernel.org>, 
 Peter Griffin <peter.griffin@linaro.org>, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Joy Chakraborty <joychakr@google.com>, Roy Luo <royluo@google.com>, 
 Naveen Kumar <mnkumar@google.com>, 
 Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-phy@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org
In-Reply-To: <90a172c2980073a09b4f01c21a251c3d0d2d6fe5.1792499240.git.geert+renesas@glider.be>
References: <90a172c2980073a09b4f01c21a251c3d0d2d6fe5.1792499240.git.geert+renesas@glider.be>
Subject: Re: [PATCH v2] phy: PHY_GOOGLE_USB should depend on ARCH_GOOGLE
Message-Id: <179448282346.507383.17246536028374736454.b4-ty@kernel.org>
Date: Thu, 12 Nov 2026 16:57:03 +0530
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Post: <mailto:linux-samsung-soc@vger.kernel.org>
List-Help: <mailto:linux-samsung-soc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-samsung-soc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3


On Tue, 20 Oct 2026 14:27:51 +0200, Geert Uytterhoeven wrote:
> The Google Tensor SoC USB PHY is only present on Google Tensor G5
> (Laguna) SoCs.  Hence add a dependency on ARCH_GOOGLE, to prevent asking
> the user about this driver when configuring a kernel without Google
> Tensor SoC support.
> 
> 

Applied, thanks!

[1/1] phy: PHY_GOOGLE_USB should depend on ARCH_GOOGLE
      commit: 518d5bc7a636696969e3f4a7f9c66483e4f35e1e

Best regards,
-- 
~Vinod


