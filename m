Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795188997;
	b=bZgNLe6hpsKLfmO2NDiv6TxvBdgbFxB0h3ttIWDcHSsSryWwt9x2L/Jn9cjM+mhd60Qi
	 zPm/NWHpHe49fWBbfJ7LqUAuQGnnQkaa0b0f3NRERVDw7eoI9iiGTxM0lu4ShSrxe9COK
	 zbvbPQM8hSrGlW88ULbR1BXJth93xv+oYpsuj/AvWv0nnf9nBhSIlM8UHnghsMljgdsM6
	 1JW41YLmNm1vRExu9PYKVdkCo4BeFcbcUch/BaLPmlZMffCYrAEAWmYhzgyNNn+ipiV54
	 uRAIqeH3qPY/ZOJ+LUa0PTsxOWD2t8Jvr36KIdcMkRwpu55rlAxiZco4xN78yAK3oFg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795188997;
	h=Received:DKIM-Signature:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Subject:From:To:Cc:In-Reply-To:References:
	 Date:Message-Id:X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=J8S1+me+z623//Nd6X9CqimLEVWZM8pGmJ7TvBk7zCU=;
	b=J+HOVdZ3yG6rE974dETHubieP9i8n7BRG3/I+7GDdAT8ZTg6PsIxAjflAYg47c3DIXfW
	 d+x62cnx7wxdgQ7VY1HsyTTqlyvn+2J4RScs4fs/4ElFlMwpbKHd7OG065OJBggk7E8ec
	 NUbNhyOL+h7dOJmrQA/ELqRlc4ZUb24GcaZaGjaAkllbOb8VCKm7D6kQ5pqXy3QSRs+uy
	 bK4dZfB6qY50wyMtzSsMalVZtgY/nLQd/NRhVw12i0FnW6QDAHxp5x7hcqLn4s+/Fr3Yi
	 bupfcGMEjIadRl/rUNTQKDaSxyjbPqQkidkIJkG28Iaw80qGO1/gp8ojV7/AOde3Seg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=IR8ius0u;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2760606A320;
	Fri, 20 Nov 2026 15:36:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=IR8ius0u
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BBB1D1F000C4;
	Fri, 20 Nov 2026 15:36:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795188996;
	bh=J8S1+me+z623//Nd6X9CqimLEVWZM8pGmJ7TvBk7zCU=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date;
	b=IR8ius0u1OFCFaBLXm0Nij7q7DUAgDPb4UddjIar4rhOi6WstBwNZxhPxBTgfLo6H
	 zBLeptmeIaaUChs1Wk8pDwhxBF29bE40E8WhW1X94GJS7EN07TnB/QwqNtQZ2qZt0X
	 qN0CuUan7pH2o5b3UT0yB6Fr535JKTN0L1I5hap3DRvlXPTI1+p+QQa62yNrpXn4qL
	 VFsQuY7psN9Yj6sf8q55UqSAB/Hy154ykGBgIU7A1TKV+oNLVjH9+l3hj+i30On3K+
	 TbKlK+chKJsmf0L/UUuBWSLKRGA/Sz6NvQkXkZelyf3xTsy2cbUA6cVYg5BTJeW5kI
	 rVpQJyupDBMQw==
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
Subject: Re: [PATCH] Revert "arm64: dts: exynos: gs101-oriole: add
 pd-disable and typec-power-opmode"
From: Krzysztof Kozlowski <krzk@kernel.org>
To: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Cc: Peter Griffin <peter.griffin@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Juan Yescas <jyescas@google.com>, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, kernel-team@android.com
In-Reply-To: <20261105-gs101-tcpci-bootloader-dt-v1-1-4b7e373778f2@linaro.org>
References: <20261105-gs101-tcpci-bootloader-dt-v1-1-4b7e373778f2@linaro.org>
Date: Fri, 20 Nov 2026 16:36:24 +0100
Message-Id: <179518898448.24590.9385388024279138198.b4-review@b4>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=482; i=krzk@kernel.org;
 h=from:subject:message-id; bh=JAP8imheMr37qpL7NTHR/Gfz5NUBJJMqftcLKN+WKVg=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBrAGj69dUMr91LVgTW+W3B3cq8RI+MdoRg9Wm9G
 3RpZlRoOJ+JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCawBo+gAKCRDBN2bmhouD
 110WD/9/2tsbWIvbjbIYO+PWMFrxEyCquuMM9Noya2QXMPW2eIWdwgGFFCJMaau6hhbD5io4xMx
 ydIoJj5XdYyPlCOgQbo4e5J61zB5VCRfbxYfCTVSewKtYsFjDGHCnd7b9Y7f2FvMJh83hFd2RcN
 Tgo8stvMhIGQ5cu5SCWoqRNSQpZC1Iljh2wBtCViV9yocixyyL3lq1IwxvlHYj9ui8UtiXQa5ss
 vIpvtPM2d23U1o0K+aZD4QneU1VxzF4KO+gChknrTFyYOTEQxER07RywAD25bgBpzY6vijyS2Bk
 4qNlmvppE3ke0m3w9DOyHSfMQSXRJ/UKk0CcGl9NzdHLZVaXLPLG8i+7Iekg/mJz3Bj6mK0GqXz
 m9FYhTolWjvBtKhpbeyOIP50sHVO6fuaej2HdchH8t0Kib+FgALmMibZCu45TAt0tonqERbMUfq
 OL5dircTdQvlo2aCZsqpP535eo4sO0ZcGYhS/WN2zTebWyQvN1ZfEd9rD984eTqdbV70Tdh/dLD
 oeRRqaXpx2tJEK0vD0H8N1pRTiMPoPrFZWFFoDSFo9IllzLnv1ubiklhVibx/nLRGHhF7+wMm/s
 V62cwNymCqeb1IcbMGouuELYSGBGOeJjBHRrW96EIHlyYWGMtfITl5MZZwgOKjnsHyAObFVjQxu
 YJ8RRNG3njZx/bw==
X-Developer-Key: i=krzk@kernel.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

> This reverts commit 817473b6ddaf9eb5f2bc7d6dce9fa13a921477a0.

Please do not use "This commit/patch/change", but imperative mood. See
longer explanation here:
https://elixir.bootlin.com/linux/v6.16/source/Documentation/process/submitting-patches.rst#L94

Please use correct commit subject style and commit "SHA (foo)" style,
the latter pointed out by checkpatch likely.

Fixed it up and applied.

Best regards,
Krzysztof

-- 
Krzysztof Kozlowski <krzk@kernel.org>
