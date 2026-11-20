Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795183189;
	b=LxpveBcgsH46MO+zxtkDmDDJNiKwm0suB4fJYPnNtU1HxqeU5Nh6QNFip92IC2Qyq+bR
	 RKsL+Og3UguCot9Yibyi4PhCZG35OgLLpAfnc3FgQbhMhFca57BFf9lu1QWubsploYOgW
	 0v5sUPJG9UsDX3KJhHhLf3hFjKYFjIlpzc+9EXs2hbtwlU1y3DLJJRPtCyTF/oaIWK9XA
	 9D3pc1+mZ8SBCdvyNibkfF6OKYtq60GjvdOGjYUqHOyp5t3qTby6/IDuVbKWOVgL6HXtT
	 5PHX9+2j8vdF2EK9UlS6J6cB3U/OiuLhBe7vV3m/vv7YQDXJmZb9ZKpe/9fDO5s3iiw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795183189;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Type:
	 X-Developer-Signature:X-Developer-Key:Content-Transfer-Encoding;
	bh=LW+kKiNqfY8HPCAqY9IfbH53r5HYTznvk+MUAJydRFs=;
	b=qw0kMpWMOIts0pxiM2dtX7/woy5VBXQyGbFK9X6IRw3hOdmc307913S954vemNTtb903
	 gHv7JxQ8YfsjDRxhpLA6PvOFjXnrJZ6Hv9UHuV6V2wvCKCiPqWUsgkqj4Bw/vsXdojYzf
	 7cZWIJfc9dX6mjV5vtE8pcer9YF9DMS/ODCB2z/S2e+ogCpmbHbQAzGtzFwXspYIYw/r2
	 gmknYXIkEWCNeyfGPy4Yl4CJJcG74rixHpXs8Twi31T2lwdYTPycNWa9AXu3ldzlWGXtN
	 WSkO+5LFhvx6KJlpLrG8XmPMaUlS75cMlz6e7xU44Oc1HHPoVFWEEhuyKIUi7/0Oo5Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="S6rtY/v0";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25673606ABCE;
	Fri, 20 Nov 2026 13:59:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=S6rtY/v0
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F0A281F000C6;
	Fri, 20 Nov 2026 13:59:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795183188;
	bh=LW+kKiNqfY8HPCAqY9IfbH53r5HYTznvk+MUAJydRFs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=S6rtY/v0m9v/0YbuaYd2Wkpcnx5stAni5jfPK1GXXGyNK0gFMVJW5ZcFY/0PWZAF1
	 ya2xfo9tzy2lvUDWcyMfsALvLeKr4ZBYaWwt8ovzyY3cmNeQ32yEmD668RLw3ilG6c
	 udzZkT8UedJGtwPYe58oJi57YYGcJ+Xg9777F+NuJWlL1XFBUdKQbtnrJcEw77P0jt
	 Q500ocXoLiNDaOUhf/uiwF6UyGHitWmh15H1nxZ/O5HVq9lkMJERbX/+HP+sHNItH3
	 Nm1pUn/tGmgIYBNNQtMMjg5u9yuGx+gvgqJU7xzmw0vNa3vHBNiwbecrQV5ukFlhbY
	 nu5v+zDjgApGA==
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Peter Griffin <peter.griffin@linaro.org>,
	=?UTF-8?q?Andr=C3=A9=20Draszik?= <andre.draszik@linaro.org>,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Krzysztof Kozlowski <krzk@kernel.org>,
	linux-samsung-soc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH v4] arm64: dts: exynos: gs101: Drop CPU masks from GICv3 PPI interrupts
Date: Fri, 20 Nov 2026 14:59:30 +0100
Message-ID: <179518315457.16443.4845385299406425868.b4-ty@b4>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <b1477db70b5a068c7ed3276cac906836031214db.1795096443.git.geert+renesas@glider.be>
References: <b1477db70b5a068c7ed3276cac906836031214db.1795096443.git.geert+renesas@glider.be>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=443; i=krzk@kernel.org; h=from:subject:message-id; bh=KM3O/+wumfVF1ZT0/KxaUkzczLZvHyFeeNmoCihvXx8=; b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBrAFJDxRsdx+/H8YhdwVZ2iRkhHLb1F5vkoaEsQ GKstWtEWlOJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCawBSQwAKCRDBN2bmhouD 14KAD/0WJxB6ha5hvZxcn7n60zSvNFl+37Tzii/fjxjGf2Dll0WBL2izQupB9JiSJwFICOpJGzW 2sWN/o0N+t+r9DvEFBEFPnM3n8YwY3ihOpxz5jqygIBh7k5eDrZyKAQxjaQPbNWcn/7hzXoI1QZ NneAlvnILwHgXatkav4R3AGDzNCidEWqehjtZ6Yy9J4gxYQhHWBJCQnLn0l3aCP4N2L80ty0VCe AKDn/re6/HzyrrkE3/KA2UZE8vljzJl0AmZien7YKRKTzTPbYm4iBoj7Ta8rKNs7Pq1tLtftLkQ 4a5bT0umZmSCeXlXtGiNC/FHzQDEAN83S2vf1H8FsGfY5iwPEOUNf6e/+H42Px/Ha+rLpQjrBtw UAe0YYxK/F4jxbGFD6gfPj0p0bwIDiuYD545zTD+gDwjp+yftuSEq/jKsaz2SW4LFLwrzfUBKDz SbUhgh/nFm+2+3kbGHNzQQLdTfFDJSzTL4B+kUR0VfMzy4RMedYotcXDcH1LM8iA1d6oTGK6Qfd Nr7MdYuY2ev7zPV+yQDsDiVOh2E1YhJBsR96C9i+NG7pA4QB6FWZlVMxq3kmi5G5cd9lAxReSRB vypOYlGJzde6qIhMdPGDg2lMobTiRC36vAjoQMqzrzF1cFXhOMNGHDubQmE9eLsq4m8s+KKJybK SPrdizxgh/pGMq
 g==
X-Developer-Key: i=krzk@kernel.org; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit


On Thu, 19 Nov 2026 14:54:56 +0100, Geert Uytterhoeven wrote:
> Unlike older GIC variants, the GICv3 DT bindings do not support
> specifying a CPU mask in PPI interrupt specifiers.  Drop the masks.

Applied, thanks!

[1/1] arm64: dts: exynos: gs101: Drop CPU masks from GICv3 PPI interrupts
      https://git.kernel.org/krzk/linux/c/306301ca9340a6c7ceb14d735abb9cc380933a7a

Best regards,
-- 
Krzysztof Kozlowski <krzk@kernel.org>
