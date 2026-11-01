Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793530026;
	b=EsrM3a6V3fsnfB9N6b8JKX8sllqKwUhoZkoB/NxMj+nwzCjRygd6GyF4ecbhfTF/0vFy
	 a6Jq6AdQhqvgYAX6aAXkt2kxpGchxSiUdvwvuYhHtpQIBYcEVCqrJpRW/kgQHMLiw4R9q
	 POJcL3nwnXCJq5BT0C0ROeryQ3tGC6v5VAsFO0Ozv0EAY734B/W2aBGEDpNzLguNxkkUE
	 aY1dprFf0zUXEubPmq0OFIVXIUxpJjIeeGrN3am9bvRgKgO+AVg20IhNNcMeotahZFBdG
	 ARCLT+Ehl+XRk6ANT5HuDVMbTXSCkvImG40epnkZZ5b8fMkY9x6iwEUiqCgO8ncZC2w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793530026;
	h=Received:DKIM-Signature:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Subject:From:To:Cc:In-Reply-To:References:
	 Date:Message-Id:X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=ciP3TE41VRL5tjg8DAT2gTyP12gWWUmxTZcVY7OvJgY=;
	b=2uymR0l5kUng64nfpo7UjCOKlJqOnKqsCxoQUApbAFmuV/YrHPU57zaCtcYmI9hCi1Ew
	 8dH6tnHgz3uii+RocnTWMfqzW8/jgPDpV/yQQ8KUJlxMy17C81fpkFYgqrtiaBxxw2Ll+
	 voQzGDri65xfRAr7AKp2VHnVb2SUNmXuEym803pj+H/X7ZEWvqdpOEZWQnM7/B5UYtN3r
	 dcPKm5Uhy1mMqLAKArRjz0InttHsRkjFh/UDyfH5dneAjOmsjZSNvyk9Tccjo+cb/YW4e
	 Fkgg6FOYbHv0UDKKaQGLqQbEfXtBelJgq6hJAsv1Fcw+7N7JyzgUcI6BuySbp5N737A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=gPQ8viCB;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B248606A32D
	for <linux-samsung-soc@vger.kernel.org>; Sun,  1 Nov 2026 10:47:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=gPQ8viCB
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 130B71F00A1C;
	Sun,  1 Nov 2026 10:47:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793530025;
	bh=ciP3TE41VRL5tjg8DAT2gTyP12gWWUmxTZcVY7OvJgY=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date;
	b=gPQ8viCB4Ijdtj/k6DT14L5vKt68azQvaBCmfH6mY6rEwPQ+JOw36FMZdzBO5JbCT
	 2FxN6rRrkwiLY8ck1MOLtgyBgx+gSRkAEKBYvC5k2aJZTD2lzHmKDS3kSBw4po1ZUM
	 hLA62Q5qGf9MJ8wNegrrh0Ao2UWbGj6Q6O1x99R8PqYdHbIBg2L5KnBCi9QhmiHzQK
	 +4sSzs+qyyioHVAZFj87+YNVxnMseb7VBn1xiiErYTmApQt/TWT6Kje4OCrSsO1JZf
	 mc4SZvWtAG/tOcVyifdgqEAx1OaA6mZX4dAXwI2MQSFgb9SsqmZGK7QARBeKpM9/IE
	 29G0hJmxIz2cg==
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
Subject: Re: [PATCH v2] phy: PHY_GOOGLE_USB should depend on ARCH_GOOGLE
From: Manivannan Sadhasivam <mani@kernel.org>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Manivannan Sadhasivam <mani@kernel.org>, 
 Peter Griffin <peter.griffin@linaro.org>, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Joy Chakraborty <joychakr@google.com>, Roy Luo <royluo@google.com>, 
 Naveen Kumar <mnkumar@google.com>, linux-phy@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org
In-Reply-To: <90a172c2980073a09b4f01c21a251c3d0d2d6fe5.1792499240.git.geert+renesas@glider.be>
References: <90a172c2980073a09b4f01c21a251c3d0d2d6fe5.1792499240.git.geert+renesas@glider.be>
Date: Sun, 01 Nov 2026 16:17:00 +0530
Message-Id: <179353002024.2955.6740233289022296167.b4-reply@b4>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=522; i=mani@kernel.org;
 h=from:subject:message-id; bh=u68oHDWGblhruYjLSJx3Jv32NsrVXxV9GQhKtKCHDxo=;
 b=owEBbQGS/pANAwAKAVWfEeb+kc71AcsmYgBq5xim4E4sFKagT25ik3q1L/btEmtp4J5NC9Dsf
 UZiDt9q8dOJATMEAAEKAB0WIQRnpUMqgUjL2KRYJ5dVnxHm/pHO9QUCaucYpgAKCRBVnxHm/pHO
 9SW0B/44Apffz+7OVHoYH9pH9J3ihL2WQSqT/ZCjV6rQFEPHF9qI1YhioOnGALvFodaDOcFI8dj
 TXIZhJ9NidcjujK7zDLglaKV7FsWmclAj9ch05ML8rlVnrIaxEjSlq2hnqQjCvLYSktFVguE0WI
 LT2LsgNUXNFvdLD2dP1Hav8gSiaCqdfbq25jmr+ktrRU5p0RNxhbKOPRCgbbXCfpOgCFZk5ROPV
 wleR0IuHLEQupJcAQkSD/sX38yqMTC8E02KXMC9gPJSf3ilvJaLtLcbzihCDC5jkMOVGrPt5LXp
 mXo9Rd7YQSRAvqXwhgrpki0/SZ8ZNPZK5MdcWwRprhn7p7Fn
X-Developer-Key: i=mani@kernel.org; a=openpgp;
 fpr=C668AEC3C3188E4C611465E7488550E901166008

On 2026-10-20 14:27 +0200, Geert Uytterhoeven wrote:
> The Google Tensor SoC USB PHY is only present on Google Tensor G5
> (Laguna) SoCs.  Hence add a dependency on ARCH_GOOGLE, to prevent asking
> the user about this driver when configuring a kernel without Google
> Tensor SoC support.
> 
> Fixes: cbce66669c82ee9a ("phy: Add Google Tensor SoC USB PHY driver")
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>

- Mani


