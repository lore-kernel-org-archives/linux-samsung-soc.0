Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793622871;
	b=JCjPSPL0YrMJKIDqU+QFWu9zEEhUpTw/OccK2zMQPlhWeF6r86RcMiK6UPRjzpfrbzsJ
	 QiQEH3dLIgqkIWG8fKYsae7GBZka7jCpLswutgPn/5zGxawWEclU66mbceGnTwBjVQXeX
	 hwq98azwJxdhCU/LuhoqerGOIolGvnJlQ1+PP49PTHdELU3d5Zt7SLhfDaqFnZqtLB6oi
	 YShExL6VueFU0jfCc6VybjHADWe0tTjJtN14ZrTtM7KvgjMSgkzx/s7c3vPJMF19PY4py
	 aYlfiuTni+nwYMkbe0o1w+hNccx8O5GTJxHlS5IjP7UL/mRloSnAeLgeYbanYBwZm+A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793622871;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Type:
	 X-Developer-Signature:X-Developer-Key:Content-Transfer-Encoding;
	bh=qFPyztT176Q3NCX48vm8ZlMz49fvWVMs0ZbSqK7hMFk=;
	b=Jzm8+Shk1ZwAUvryUXuJXbQuUo9n4zyTr8QhuXlggiUtZRHNHmTI7iBDfpWga1/ZL9Tb
	 q7nUIFZs0s4XZAJpGTjvVohbZimZ1U+/3N2ACBt/qNG1tXZn5gyBly7lmQyMRt8y6RGSd
	 yjP/3b6N5mCtAqm5je/aI24v7xyj034SYDihz9uE6cDfm4OYkhR1oTMX/EYgMz/v0ILNi
	 jo4V/P+c5A59o/7lpjgbYdDTNFnEbXyeCZwI4Vlm6ZwQiS7Ukc+Houh4WtdQGgFh+ogra
	 PENQuj9WsG2k3dz+L9LrrJ3/RmPLTcDeRpg0+3cnHNxNw7Dcl7eiyqKK2UNvfDmTWjg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=aCpbHumV;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59BEB606A32C;
	Mon,  2 Nov 2026 12:34:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=aCpbHumV
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2A7AE1F00A18;
	Mon,  2 Nov 2026 12:34:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793622871;
	bh=qFPyztT176Q3NCX48vm8ZlMz49fvWVMs0ZbSqK7hMFk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=aCpbHumVYEejY023NxGrQPkgORAOLDqFBr/lKlOmoly4n3si58GiHod1HxRD+YX8E
	 FMx6mIvmvsmgmEhw8LQFcZrfCsy66AJb7kFfCOWtXF5nfkdCA/PM2LeH6QCMd85Zc+
	 q/JBCO0qqBm76YBjW07sNykYI/qcIH0Bc6+cpScWXbJAUSTgtZMJ/dJRgUB72xeJpw
	 1r/c3V4P8jmSBP2Z1Ix7f3lsVZw6Nwky7kny4rpkLj4YMpFCBgnX3AF4ycAx5m607i
	 qQEP7wp/wuOgrWUXCIDnux6x6RcrPxL+/Mw6X8+1rxVr14R5OF9Aum5YhOCWFA0OKi
	 MXUdz5pZ1Unnw==
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Peter Griffin <peter.griffin@linaro.org>,
	=?UTF-8?q?Andr=C3=A9=20Draszik?= <andre.draszik@linaro.org>,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Amit Sunil Dhamne <amitsd@google.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Badhri Jagan Sridharan <badhri@google.com>
Subject: Re: [PATCH] arm64: dts: exynos: gs101-pixel-common: add USB-C PD timer and revision properties
Date: Mon,  2 Nov 2026 13:34:07 +0100
Message-ID: <179362278574.150793.9490214857479214179.b4-ty@b4>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261003-gs101-typec-pd-timers-v1-1-4b6f3235133d@google.com>
References: <20261003-gs101-typec-pd-timers-v1-1-4b6f3235133d@google.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=732; i=krzk@kernel.org; h=from:subject:message-id; bh=YAtD549CiW+R0jb9Hz8nSE5JrJvDXAfq+kgwKxyaJiQ=; b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBq6IM/mkNJevdXpq9Wq4JpdL9xd9nKtwmXjLR9u aeT1n94fGKJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCauiDPwAKCRDBN2bmhouD 19bsD/9GdkYmvZHZaBXj3i1FvbOH7rs+o9J/pxPDhkH+QhotaNh+zU+Fln85KWXB/wa95T8wPhJ UigShgkPEoTz7/mAclaSTMwAg+2HIiaBrdGfiRPUDb0eOiLr2CpySxn1br0W4nsZM8YELt4oFR2 bx/uYYLJgTnK+OqU/8QO/UoJ0/jF5KCCZw7a9CUHV7/WvR5ATOJusRtUhc41v8n3w0Exx3T5tBd 11UcjLxeJVFEo1Ww1W2FCC0q6z7B+VEc3F4N2GiIR+CxAa3Il+qIGhab01GWJxIjBeO5Nnn4WiD FuLsSIkLP1Fy9C4C2LLraqFHg2dQ7CysamMk4lfi/bIZJW6XU04T2AZqxwf2u5swPAUyV4ad2TM W8MiRVLvaLwP6a+NM7fWrD1RKCJYzrJ9dKiBSGQsmyLvUOLzeAzLhrvng43gWZHHkD0bYk69L2G 0tNgr77aILYBv2O0NYu0fQXwafanI18IVolCYy/lU7czxgWOhTVEUFqP8bAvfTYraIx3K6CH9S3 C9nkWzodi0TN59LeQXBqt0GLj7PiInTkPmhE6rtfLKAFODvzyaoCVDTlA5m+tFgvGgqJKKE71/5 7FyPw513VRBRq6XoF9+IFxBuinrrfkTpeqfrMhbdKKg9bSSDADmVzBj7icuhOKZoq/BxBKA4Vr7 XrVnjSJO6xZ95y
 Q==
X-Developer-Key: i=krzk@kernel.org; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit


On Sat, 03 Oct 2026 06:48:30 +0000, Amit Sunil Dhamne wrote:
> Specify the tSinkWaitCap, tPSSourceOff and tCCDebounce timer values
> for the USB-C connector via the sink-wait-cap-time-ms,
> ps-source-off-time-ms and cc-debounce-time-ms properties, so that TCPM
> uses the values tuned for gs101 platform instead of the defaults.
> 
> Also add the pd-revision property to advertise support for USB Power
> Delivery Specification Revision 3.1 Version 1.8.
> 
> [...]

Applied, thanks!

[1/1] arm64: dts: exynos: gs101-pixel-common: add USB-C PD timer and revision properties
      https://git.kernel.org/krzk/linux/c/fc557ccccac92028bcedda4bdc59dffc56d3f96e

Best regards,
-- 
Krzysztof Kozlowski <krzk@kernel.org>
