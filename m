Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795443512;
	b=IE6yuKbVIs86GjaCyRNJJ/5rIMqYGkGipKhO4IyMwy4B8ChoU54SLsloCOHP2kRnFseE
	 rDbNAdJJHhgkEwjBaW+plbTjSLnIpP2ejr+NxdGtqUuYqbTyf9txDRvxUc6ibwlieXDMc
	 rE58E+h4CmYaMVAxXLTPX0IB+t6rnA0FLu2lpYrULKYNM3CUSYuhIQrR7l1Ux4JUwZtre
	 PhgoyfDI43T8scL5nOv8RRjJIxNc5vzHlLa28YNvG1/PV+k7mGGAXfd26eN+g+B+033YF
	 RojDbPAmMF6UQHbv8Gg9LcwU513IyFUWRa+4Mb3qjFlmbeL57ONB03ciUgiztPpSVAA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795443512;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=p038IxcP1LIpPQwiIMGTCY2lVaAX4hwB1WZdznpqdbk=;
	b=dfyT9OWdErCLrNvYsW6ycCu5A4QoyrZP9/+Kbwr1dRPVKSgmrS+A6Hebg0UccDMLcbTX
	 OxqO2QD+hAdXLKoEIZwzSuqrRlxf2+Ri0MzwSp1uGbSRS8TlcTHYAZiL7/bW3dBodNKjD
	 DGnzcG6q5Y61Oqz4tKkWnrGZon/CSHGJwpNrJywvZ/BoXEShsQlbyEeCQueJlgIIa0/oi
	 u9b0OOwv6TB6i9IuksTfWHeFU2/OibEYg/t+mGBlq1Alo7SyJYy9rb30m5YQVoFdzGVwi
	 svymqHIz83Dpmn9kR1CQ7BdGUnXkffT5RUCWSmA6MbyAWL9mbnhV581Cx+sFp0hex8w==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=kzQCQe2K;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E57D2606A31E;
	Mon, 23 Nov 2026 14:18:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=kzQCQe2K
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795443511;
	b=nohEL4wH59/hQb78zNVpixLTz88KVIUEkCItcxK+NUT+z528sD41/vJwlyO5ER89OodP
	 iD8LOYsi3e64/GBgyDfshpGR4NCv3YHgLyMVVAG8+01d8oGnRMsrPNjSAk/u4dlVUxFpQ
	 E20XJWtgEgPQjbkoaUX8WLL/aCLXs5tLE/SN1X3TKsR/ntYC3V57oOM3F5gnHHMw5JR4V
	 0uLBJbtZYctvjWbXO0TdP4HgZ9Az1UYASVg+/LDGPllAgbXtFua5/5ittRQbt2TCkZVfj
	 2Uqd3e7KIqukooUW/k6vXgdvXVx+vzw2GAlIsR0BvurtgjX0ZexPtuMOoMVYfZykK3g==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795443511;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=p038IxcP1LIpPQwiIMGTCY2lVaAX4hwB1WZdznpqdbk=;
	b=hJ1Of2ZS/4LrORbmx9T4ssokg2+GWtkdi4TXvKyxeRSRaYL8UVpOuDSMANcVmVT32GQC
	 2B1wWEgbLL7BW7w/y7MVi6Vk9FNJc56a53nYdrBrsIR6e24EFMB58WZZ75LPzFWOYgZuO
	 yCOHAczEU0Kw3UQK1KDBAZdSipO8MH8tQAi3fwvw6wVgRDE5wDV31b/UW2jbyC5ooR4Bb
	 5Cymm8FcEWRa/IpxJeqRXFrAysp96nJhqhK7IFh+eU4P3dmzxLlJAUkZqTkd1EJRepA/k
	 CTP53eLlgHldkvMm7CdMaekho/se1o9deSOwF0b53Q1fLn3nsqeyLD9MvOnJ7FhcLxA==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 05DCC1F00A3C;
	Mon, 23 Nov 2026 14:18:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795443511;
	bh=p038IxcP1LIpPQwiIMGTCY2lVaAX4hwB1WZdznpqdbk=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=kzQCQe2KC6EFuSGrhtQLNA2bqn8lhkd9AK/8GJhC2lJLL5O0pyeZxcYwSGC05k9f+
	 y49BmKI03nf0bqQvwbgvw+q0JHDRMLEmQjJu16bWtKnKwbLwDMHPi0uTF49kRVK73X
	 2pBg0xtkQEMUHdCxB4VXvTB7mbyWCzPL35xgmV0zt3aFMak6FiVT+ct9nUqdKOeFqe
	 8m6US2biNdlPdiyS5PaIEI9ziPQyuqPVH3M7jYt4gFnCKJ8pQiUN79oStxmDEf7uTq
	 0Ijp9bJb4aInyDdqLXuWXUDReOMuMV87ZOcLPpEghIPBEUaN44ADe3Ll7mVlv/3Xp7
	 wpH193M4h/z+Q==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 9045A4C4CC;
	Mon, 23 Nov 2026 14:18:25 +0000 (UTC)
From: Shigeaki Asai via B4 Relay <devnull+y-asai.0816.docomonet.jp@kernel.org>
Date: Mon, 23 Nov 2026 23:18:23 +0900
Subject: [PATCH RFC 1/2] clk: samsung: exynos-audss: defer probe until
 pll_in is available
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
Message-Id: <20261123-exynos5-subcmu-defer-v1-1-43aef47d4f2b@docomonet.jp>
References: <20261123-exynos5-subcmu-defer-v1-0-43aef47d4f2b@docomonet.jp>
In-Reply-To: <20261123-exynos5-subcmu-defer-v1-0-43aef47d4f2b@docomonet.jp>
To: Krzysztof Kozlowski <krzk@kernel.org>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Chanwoo Choi <cw00.choi@samsung.com>, 
 Peter Griffin <peter.griffin@linaro.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, Stephen Boyd <sboyd@kernel.org>, 
 Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, 
 Marek Szyprowski <m.szyprowski@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Shigeaki Asai <y-asai.0816@docomonet.jp>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795443504; l=1456;
 i=y-asai.0816@docomonet.jp; s=20261004; h=from:subject:message-id;
 bh=0WAaBWSTBR/BaFm9s6nACS8IfkOWalo+FbjaB+ytfE0=;
 b=ojdX6lEvfEj1MUJHgjI6r7HyjtQLZpgqI5HQW1eBkBLcHCNLBocqjpoWJlXr0HFqQp4hJI2QZ
 O/BlN2Pwov+CIyNi8aS4+xZmIwXyf2TU4dDIhFaVg2uQoiU88ETYC6S
X-Developer-Key: i=y-asai.0816@docomonet.jp; a=ed25519;
 pk=jkd95ViSn8i/X3oPMHYG1A8mae8IOwOKGE64kzLqC5c=
X-Endpoint-Received: by B4 Relay for y-asai.0816@docomonet.jp/20261004 with
 auth_id=1110
X-Original-From: Shigeaki Asai <y-asai.0816@docomonet.jp>
Reply-To: y-asai.0816@docomonet.jp
Content-Transfer-Encoding: 7bit

From: Shigeaki Asai <y-asai.0816@docomonet.jp>

The "pll_in" clock is optional, so a failed devm_clk_get() is silently
ignored and mout_audss is registered with pll_ref as its only parent.

On Exynos5800 (and Exynos5422) "pll_in" is CLK_MAU_EPLL, a gate clock
of the MAU sub-CMU. If the sub-CMU registration is deferred until the
power domains are available, this clock is not registered yet when the
audss clock controller probes. Audio then runs from the 24 MHz pll_ref
and 48 kHz playback is about twice as fast as it should be
("failed to reparent mout_audss to mau_epll: -22").

Defer the probe when "pll_in" returns -EPROBE_DEFER.

This patch was written with the help of Claude (claude-opus-5-5).

Signed-off-by: Shigeaki Asai <y-asai.0816@docomonet.jp>
---
 drivers/clk/samsung/clk-exynos-audss.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/clk/samsung/clk-exynos-audss.c b/drivers/clk/samsung/clk-exynos-audss.c
index e11ac67819ef..7c06350111ed 100644
--- a/drivers/clk/samsung/clk-exynos-audss.c
+++ b/drivers/clk/samsung/clk-exynos-audss.c
@@ -153,6 +153,9 @@ static int exynos_audss_clk_probe(struct platform_device *pdev)
 
 	pll_ref = devm_clk_get(dev, "pll_ref");
 	pll_in = devm_clk_get(dev, "pll_in");
+	if (pll_in == ERR_PTR(-EPROBE_DEFER))
+		return dev_err_probe(dev, -EPROBE_DEFER,
+				     "pll_in clock not ready\n");
 	if (!IS_ERR(pll_ref))
 		mout_audss_p[0] = __clk_get_name(pll_ref);
 	if (!IS_ERR(pll_in)) {

-- 
2.43.0


