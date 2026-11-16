Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794823305;
	b=XFw2b2CSg0dc9tqwfr49u65k57gyV0e05gbRdYeCT+WAT2Jc7ewdzdyQxLBfoVlXaBjR
	 eZAjEzs082qMZf7baQ0H2Og4tyWaj+TLoJQMNbUAa7xcjObQd2NUxfwNn01C1lyOvFXI9
	 lXnGRrYKrXRHUdf4YezEYI1/5KUOdBQVq+SpBAOWJDwex1DojDETGgzP9tttIOt7jmdSP
	 j9kCod1ygpemXWQioPUcj8lkjwVR6AF4tBrKEJM/8e1OVVAkiZgJbwbBLDaBdoKmn4CVP
	 OhRa2xQwaGI/WLek45W3BeVQHgQ+HehM0EyEHRBkNGQIq2d76nb3w1Z/S6ovHve8hnA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794823305;
	h=Received:DKIM-Signature:From:To:Cc:In-Reply-To:References:Subject:
	 Message-Id:Date:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-Mailer;
	bh=WGx4yjZhEde7TvTLPPi9oLKwIm2f2ZhCwsVI7E4TU3s=;
	b=dBMxKxx+z6TB8REapraEiGNs1wKfk11b8W+zrwYvgOw8nF7gy37Ln1yLtaHG4SaSHxuQ
	 cz0915eo09g/Vilr1/IsQ20JUfcyEffdhxoVevXSAPrOuC8A4NuZ/aQtCz1I+eMblZJk8
	 ZfUYF5z0IMDNB3tDPVecMadJnZoDu7sG6eJlf9S1m/mokggHu9YaCcde2hXrrI1qSTVID
	 1vVHFz24ppfIuucINhIMl/1Bv30JjSpRfOVS9EE6YQbSS15YeERoqcAHS3SPPC2KBosef
	 lkRQrdNFRvcAvs50SZ+gwn4twB9UvGN87r/Lk5r4nhd+cwUY+m5Y/CC99JB2ZOUJsEQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=fu8tBIfc;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7099C606A31C;
	Mon, 16 Nov 2026 10:01:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=fu8tBIfc
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A9BAD1F000C4;
	Mon, 16 Nov 2026 10:01:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794823305;
	bh=WGx4yjZhEde7TvTLPPi9oLKwIm2f2ZhCwsVI7E4TU3s=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=fu8tBIfcVgM+sIFEkI+nzsaLohduaXylLOLdJs7oPhIpZCaDgGRyDIwJM7KV3Aoad
	 BmtIT2/JFmw6YO1hF/rcga34joJ5I9WOraeQnrA5cUA4EUn+s7uBOF2TmHaoYsGuBz
	 Y+nhu+yln62MU5CXk7p/hBiGCeKX/JMC4lH6TfAIksvDn3i2iekbooR3cehX+Jw3U5
	 s8IQo0YnfGwghCMROSe2atJSsqTagxds9e/Rgmq+6plXldjiO1JO8v9OVmCe9iXiBZ
	 nEzmb9iSUus4zrJZrkWPB6RDr6faY95ftNVNp/4YW56Bg6rzNz3RoVROlSPb1T/To9
	 AaOv3q662vvBQ==
From: Krzysztof Kozlowski <krzk@kernel.org>
To: s.nawrocki@samsung.com, cw00.choi@samsung.com, peter.griffin@linaro.org, 
 alim.akhtar@samsung.com, sboyd@kernel.org, bmasney+clk@redhat.com, 
 jbrunet+clk@baylibre.com, robh@kernel.org, conor+dt@kernel.org, 
 Raghav Sharma <raghav.s@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, is.gandhi@samsung.com, ts.amit@samsung.com, 
 pokala.reddy@samsung.com
In-Reply-To: <20261113110612.3265841-2-raghav.s@samsung.com>
References: <20261113110612.3265841-2-raghav.s@samsung.com>
Subject: Re: (subset) [PATCH v3 01/14 RESEND] dt-bindings: soc: samsung:
 Exynos8855 SYSREG compatibles
Message-Id: <179482329921.39377.1080590759697882936.b4-ty@b4>
Date: Mon, 16 Nov 2026 11:01:39 +0100
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


On Fri, 13 Nov 2026 16:35:59 +0530, Raghav Sharma wrote:
> Add exynos8855 sysreg compatibles in bindings

Applied, thanks!

[01/14] dt-bindings: soc: samsung: Exynos8855 SYSREG compatibles
        (no commit info)

Best regards,
-- 
Krzysztof Kozlowski <krzk@kernel.org>

