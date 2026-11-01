Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793531051;
	b=hbm4xMW0F1U3S7rzZln2w4j4na7/UEWhUiZjcJ/9TiLRMX+wyBvN2fRqoC4J509VyXLq
	 bligdKwLchGQyxLfFG7cyuweExwvrATRWqTKSyVEQ9dqfOR4Hi03tbi+HSfDFw9w3672/
	 fKKuQscqye1pE11VQW8iIFdFDby7t8uigWV2wzib8EpGO83HfR3Bm4tKmn6kGdkqDY1MN
	 myQ08BX9qAEXWrag6HfIEy9+Uxp+M9xewhZXD1bca0F62lltYilkIam5a9FxXhp6K0Ni+
	 9tkqgO0idj33C1QXZMGVwuWt0k4pffMQrvQogYSUxzU0y6WV8357IR9mje/QYgx6WAA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793531051;
	h=Received:DKIM-Signature:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Subject:From:To:Cc:In-Reply-To:References:
	 Date:Message-Id:X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=YvFQlOUFIJL8wjzKncMYMsofkDAlkEk9YwsTQ2MFUHc=;
	b=Dlug7Syq6CymlLT+z2zvJBG7jEXiZPqDyDuq8fB6B9vpiuXJrgk2iiikAD4lRqek7atJ
	 tP5zqiuEePm0OuBJ7fTXShc4085lUEENzalERoCqiBK+hHLuQKqenlJY9nrdwDGMr7y8a
	 6MCpenjctNIkIVHSPXnHzZ/G9LBAJbUdxQQG50gv6kcwtiS435FtRya5F9dEpm0HpbEQp
	 zE0bJ0xO0ypvy3dqEpJty+jbQ6Nw1Xozbm71dmRF21B/X5AI6eWhE+EDP0aYTGNCIEclA
	 oiqnf+NlWkNtkn80qAmnnRvs1S6EbXO3u462kHtPUaxWL3BHUabgZNoV9XCa/Qdwd2Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="L5CiVr/G";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4912606A324;
	Sun,  1 Nov 2026 11:04:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=L5CiVr/G
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AAC401F000C1;
	Sun,  1 Nov 2026 11:04:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793531050;
	bh=YvFQlOUFIJL8wjzKncMYMsofkDAlkEk9YwsTQ2MFUHc=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date;
	b=L5CiVr/Gt/fKSnAbUV4j0TATCnPGEWPLW8svHuajzcZRLKoPaUMy5X6l2mzT24mn+
	 xRpp6KI27XfsW5cm8imiG54eGTjCbQ1avu71JjBfO6Uwv+rrKebjAUOB1hEFSwBLUR
	 gTsGXTy1AoTEHbHnPGplBUTzGE5/pTNZDutAX/7TpMp2IkyFqDdqTQ5sBglAzQO3aX
	 jT4UcUEI6Uzbt8iAW00YOmyqV1yTr+8tZbxsJef1d8ua++GIRBSmkY7/Mbcegi8wuY
	 bk791VEzRcK/DOmw2fkp7xTBlv+1lr+6FwOudFz4WOg3zaQHMjh4RI1kRYZuaxz77/
	 FxUpnRx0Uh/tQ==
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
Subject: Re: [PATCH 2/2] phy: exynos5-usbdrd: Add support for the
 Exynos5515 usbdrd phy
From: Manivannan Sadhasivam <mani@kernel.org>
To: Aiden Isik <aidenisik@member.fsf.org>
Cc: Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Marek Szyprowski <m.szyprowski@samsung.com>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Peter Griffin <peter.griffin@linaro.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, 
 Krzysztof Kozlowski <krzk@kernel.org>, linux-phy@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
In-Reply-To: <20261022-for-next-lucky7-usb-phy-v1-2-2e47f8484bf4@member.fsf.org>
References: <20261022-for-next-lucky7-usb-phy-v1-0-2e47f8484bf4@member.fsf.org>
 <20261022-for-next-lucky7-usb-phy-v1-2-2e47f8484bf4@member.fsf.org>
Date: Sun, 01 Nov 2026 16:34:03 +0530
Message-Id: <179353104399.2955.18059371046251578542.b4-reply@b4>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=333; i=mani@kernel.org;
 h=from:subject:message-id; bh=k0kivXC91YJ9ydGLFjgg9cV2aYT/3fbfHC2TkzZeQL4=;
 b=owEBbQGS/pANAwAKAVWfEeb+kc71AcsmYgBq5xylPm/36572fC7jalo3M7lGxtto6fI6GyvDS
 QmfTEoLEcCJATMEAAEKAB0WIQRnpUMqgUjL2KRYJ5dVnxHm/pHO9QUCauccpQAKCRBVnxHm/pHO
 9ei7B/996lzB9IF8yZ1xlFjW/Q9LgKlADFgT+zK7F884JdRlmnuRYi4YD+5xiwF8H3rz+e15C2q
 JG+CXo0X/Aj/Yvm/kK4m0t+GdYTVNiLvWofC+YarL/m0YIU4ybxZvWsZTIJrj/VE0tLbsBxQmDa
 dtanz5ce4gLop0Q6/mV7v44Qn3/9GdIcyV4OUaktdACKRDTyXJIlm/NxjsPwIaoYfyKXCkInPc+
 jZCFGc1ODDYsSVN3mmnAcjwfQan/bR6OLzd1yp1YOPzVn9nkDDG57GwR2y1lhreXKGQGdBvbCvB
 bw+Z82YI7RvuAIet5jKu7Y8EbuPSjxipnnKHP7XItfdDEufi
X-Developer-Key: i=mani@kernel.org; a=openpgp;
 fpr=C668AEC3C3188E4C611465E7488550E901166008

On 2026-10-22 17:46 +0100, Aiden Isik wrote:
> The Exynos5515 USBDRD PHY is a USB PHY which supports USB Super-Speed
> and High-Speed. Add support for High-Speed (UTMI+) operation.
> 
> Signed-off-by: Aiden Isik <aidenisik@member.fsf.org>

Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>

- Mani


