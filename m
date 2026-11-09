Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794234733;
	b=yI0kV47BGiy3hPhd6MyKVt1XkopgY4bGcqEvbNNI29WPVQodZ+NmFoZJEvs9GQFZFAvd
	 B+dQM8k+ul4D2sJ45VoZhSz0ptXQYb2LUbha9pmZSp0nE9/hfRQO/UuJ38pzF7/UM+7E9
	 muBc3TcpwUy9Xjg8uPGgtUPS0fzih2d3ArcSTNzVM6vjjx51OjrImHWxOzOzrKuKy/OKX
	 bZbFcFdBov1WCp7ZjmPmxTVhAwD5X4EDDzHnbWkixS6SvdDN9LJndxIOpiUjXHoHQVt6V
	 2H9KMnyCO6mj7HaoTnn0ptDd+zXggpAVovcrxRWVo/T1x0tRvN3roTxDDkO0NTI7sjg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794234733;
	h=Received:DKIM-Signature:From:To:Cc:In-Reply-To:References:Subject:
	 Message-Id:Date:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-Mailer;
	bh=cTKHXfqBESP9wt5hJN1sKPgZ/ergstJw0rnMyE87Ff8=;
	b=t6nYe8SSGFsJ7xHV21/vQo5qUJBx5i3tQYx5Ybx/7jli5kWTwMduSq8GAF6W6DOJS63k
	 SWo50UxnCfXHPFnwnY9P46vWgcnP8bE0Qn+BwRow1ux713+9s2XjqqQpsYMX40+cgbUMC
	 Cbhkrzg1PqHsbxcO00AxoTXW1E5oCczeuGMJuUkr4nK9a65zICe99UummGQTg6FsiHJrQ
	 m1oitfvbDbBl9LYD9N5qxEj1AIPcIL+pb70iqItGuDtOGt4A2UQ/ySx7JowSxpZ3yaeqD
	 VGFHu7j/jY0pbv9GVM0BapzN3F6mcvA+9d+81H7IScpbHkAFuXesDn/0wr7bjsDGeMw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=c7lXWbXT;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 365A3606A31C;
	Mon,  9 Nov 2026 14:32:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=c7lXWbXT
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B0B511F0089F;
	Mon,  9 Nov 2026 14:32:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794234732;
	bh=cTKHXfqBESP9wt5hJN1sKPgZ/ergstJw0rnMyE87Ff8=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=c7lXWbXTc5U2+EEOmtj4LKiqGiciACq9w28CT1dDgv1HGmy4/mXjyOKpvMki+o7FG
	 IYio5bUPJm33Qktsyua43yE1FsJgV0hIwuGRm3e2a2LsZUoaTS4x7AtDkeUuYIqCbX
	 TdXY5ExVojnbpTgnb2/PuuigbeUOm8pk3nvtEq7zwqfH4DKpSNpyYC2JwASnB4NIh0
	 b1GazwKm22QOfb7vYk7bjYaaTTYhowEMRgefasOYRg+tgHVgHHDFLbb9COI1Jt26aL
	 QHyxPWS84PGsDFBOuE39hffE36sg5w0FpT6lQFDYEbxOH5oOhFH01+Yd7QhiWlywmO
	 IKz2N3saJVLuQ==
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Peter Griffin <peter.griffin@linaro.org>, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20261104-acpm-tmu-dts-v9-1-e5c53cd8b440@linaro.org>
References: <20261104-acpm-tmu-dts-v9-1-e5c53cd8b440@linaro.org>
Subject: Re: [PATCH v9] arm64: dts: exynos: gs101: Add thermal management
 unit
Message-Id: <179423472913.182531.10413692943270091407.b4-ty@b4>
Date: Mon, 09 Nov 2026 15:32:09 +0100
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
X-Mailer: b4 0.16.0


On Wed, 04 Nov 2026 17:17:58 +0000, Tudor Ambarus wrote:
> Add the TMU node and thermal zones for the little, mid and big CPU
> clusters, and make the CPUs cooling devices.
> 
> Trips are ordered by temperature rather than by name, as the
> power_allocator governor relies on the order of the passive trips.
> 
> 
> [...]

Applied, thanks!

[1/1] arm64: dts: exynos: gs101: Add thermal management unit
      https://git.kernel.org/krzk/linux/c/c916d326360966fa41b1d9c3fb659215053387f5

Best regards,
-- 
Krzysztof Kozlowski <krzk@kernel.org>

