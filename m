Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795117762;
	b=2dGww2HTpZgtjUh0eghvvLHBgMYRU0/sFpXgxmj/76CWaI2A+WiZpdNNFhOcDCmNuOM3
	 Cac/OUbkX0b0PPc7uGBIJ1SzGj9dHFsteJdHbaczxCFqb1KUQANbFZSuNuLaS+QzgAdP7
	 RBKQ6qkUcN162TFdK+FBILXXCUOIcv4VD3BZHVRcFwOvicq7pDWNM266JN0ly6P3TrmEO
	 zi/cmNq5EbKaRVcw1muAtCva6VnJR40TIHdTpWvUuqQLKp3xC9fc1qqkOz6gCPKd5bPur
	 SCWgz+cjdLxeqvwkIKfwtd8SjK9W+SsC9VHul1Mbt/JvvBDtESAt2/K7mgJxvWziu7Q==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795117762;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Endpoint-Received:X-Original-From:Reply-To;
	bh=Gg5qBFruImsSPUzRHqmcU2x9q+Z5Ol2aaow8kapAZU4=;
	b=lOkKWRYG/fVMtnEyHL01nZkxXUY+k7Dk28zviCgajIptfI5U9qo3Q7jx8oend/pgI72L
	 RLO2hvybsnwNYRWhzR62yfEvjzzr6/o5ACE6vkBMLUfGlVhexXYjopa5EZQ+GepuFGOER
	 sls+5WIfvENmAkImM9fB92hoqzazlJmKbvd2EJj5MiEtpdpFoYNrdGaVIoRdO5Q4tBum/
	 bei2s/OcP+ZNbrr/sGE1DBI2KmR8eg99dpDIlKhwUQswQ3LlGgTxXMdX1poKBzgpny5vm
	 OHUmgbKTKh+TojsdMxou1P4mCfkXaR5VH8wnOU28hwopd2Wul2X8N39db++ien8VcnA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=oDL9HOEB;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A81E4606A333;
	Thu, 19 Nov 2026 19:49:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=oDL9HOEB
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795117762;
	b=jOGxAN665LXvhIOigHaByZD5npa1mcdaLMLLITuHrVbl7WrczS3ItuAq4Qlkj2FXqX+r
	 2tIBP6JbPYA5E0eUfAQMMvkBXvsBgxQWiaSfjoEihihMRygAJ7LbnxTsOcniAXpUYJ4VS
	 7mhSWOm1OzmnL2o3xyvgB1NSBObNzCeIx73oyAt8BX6ibOgWyEJg/XX7OXOtUz4xM+PNV
	 rvO5PUxHzfsdmRIZtEzFmd3d4QUZYiCrRRHJ8fx/9wc+H6LZs6gwR1HlZRUbHDd225Y0Q
	 cchmIdoFouK7rnThNmxA+8L1LUfa2sh+o4XHBIgMjz/QNisuRWB/AHcHwO3dhDnjXGQ==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795117762;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer:X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To;
	bh=Gg5qBFruImsSPUzRHqmcU2x9q+Z5Ol2aaow8kapAZU4=;
	b=0ugLYTDpYDizhsrY2JwfTpy6zHBnP9lgghY67TjSFCM5eoCLYJrepNVm022JYika5gq0
	 TrN012drexdIsEF1JOtagwArcqbTDCMMIuJNcSfl84ZthssLpk1HBHIaPFy7X2mojyE8C
	 XEM7xAG1HHQ+Ef9fAUzwqu+gydiUJRkI7jGt3eXo9STyWLrvYBHdKDwNH19zGmvcFTsCG
	 BaH6PTKA4Wr9man9xs4sRbDXZMh3fcoNdHIW/Ded+Zha4N7qUHEfdqwlWFX/I1+dO5HnG
	 qAwdpb/rJ7mdK7WlUBI7zqakeXRjTzCEGH4VgkC3Q8sxE4XOayykxxEUXwfDkY2o+MQ==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id ABB7E1F000C6;
	Thu, 19 Nov 2026 19:49:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795117762;
	bh=Gg5qBFruImsSPUzRHqmcU2x9q+Z5Ol2aaow8kapAZU4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=oDL9HOEB+BsQVLfXskcjJUwdtQLc9YVRmf/9ybMuj+en0t+aBlR7RcpJvKcWUMs+M
	 4RrMClwqsPeNFLPz8WZmht/B/+N7NLRM0j3mHbJ3suAVW40M1dU4+98iizX5GrvsD1
	 J90hwnYsuA0lIzUE6foK+Wk1IpS8z6WrEoqJYh20piweyIY+SKs3fAkf+FfTlXvRUG
	 4pqKwx1FOaeTN+F7sVlgCkIrh2IFpTTVxVytgijh6pZroJNFgNw2xNBPzAOT0e2p1U
	 pQ+eM5aR6dI7I/+q98eKrdOnkkhjiqsxo7EzRw69HwbZEzXxdr9DwrfCwab2Ib8eH9
	 CWJ4uEqJHnHFw==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 389034B404;
	Thu, 19 Nov 2026 19:49:21 +0000 (UTC)
From: Umer Uddin via B4 Relay <devnull+umer.uddin.mentallysanemainliners.org@kernel.org>
Date: Thu, 19 Nov 2026 19:49:18 +0000
Subject: [PATCH 2/6] dt-bindings: usb: samsung,exynos-dwc3: Add Exynos7885
 support
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
Message-Id: <20261119-gta3xllte-usb-battery-v1-2-0cf5f763522e@mentallysanemainliners.org>
References: <20261119-gta3xllte-usb-battery-v1-0-0cf5f763522e@mentallysanemainliners.org>
In-Reply-To: <20261119-gta3xllte-usb-battery-v1-0-0cf5f763522e@mentallysanemainliners.org>
To: Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Marek Szyprowski <m.szyprowski@samsung.com>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Peter Griffin <peter.griffin@linaro.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, linux-phy@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-usb@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, 
 Umer Uddin <umer.uddin@mentallysanemainliners.org>, 
 David Virag <virag.david003@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795117759; l=1209;
 i=umer.uddin@mentallysanemainliners.org; s=20261109;
 h=from:subject:message-id;
 bh=v4DbW6fDalAVYk0Te5ZSWb09z4/f2QgblZnvvRGhkXU=;
 b=jmKfYf+qTlQd9d4FBC5QF2O23tXQdfJDxnNZ6ipXFAqDnWYNWcpSMYyMMu9M2IdQPbhmBkBQq
 wzptHRFlRhwB13miEVgN2al2PTGUYX2ZVzT52IDPbhv8P6+WDAhrLXd
X-Developer-Key: i=umer.uddin@mentallysanemainliners.org; a=ed25519;
 pk=Hsgrt4A72CFTe27AI1AAWlnLsiQrlb4+T+cbrfWDhUA=
X-Endpoint-Received: by B4 Relay for
 umer.uddin@mentallysanemainliners.org/20261109 with auth_id=1466
X-Original-From: Umer Uddin <umer.uddin@mentallysanemainliners.org>
Reply-To: umer.uddin@mentallysanemainliners.org

From: David Virag <virag.david003@gmail.com>

Exynos7885 SoC has a DWC3 compatible USB controller, so it can reuse the
existing Exynos glue layer. Clocks are the same as on Exynos850.

Signed-off-by: David Virag <virag.david003@gmail.com>
[Umer Uddin: use samsung,exynos850-dwusb3 as fallback compatible instead
of adding a separate match entry to the dwc3-exynos driver]
Signed-off-by: Umer Uddin <umer.uddin@mentallysanemainliners.org>
---
 Documentation/devicetree/bindings/usb/samsung,exynos-dwc3.yaml | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/usb/samsung,exynos-dwc3.yaml b/Documentation/devicetree/bindings/usb/samsung,exynos-dwc3.yaml
index 8af0143c3e47..f62e3ed82257 100644
--- a/Documentation/devicetree/bindings/usb/samsung,exynos-dwc3.yaml
+++ b/Documentation/devicetree/bindings/usb/samsung,exynos-dwc3.yaml
@@ -24,6 +24,9 @@ properties:
       - items:
           - const: samsung,exynos8890-dwusb3
           - const: samsung,exynos7-dwusb3
+      - items:
+          - const: samsung,exynos7885-dwusb3
+          - const: samsung,exynos850-dwusb3
       - items:
           - const: samsung,exynos990-dwusb3
           - const: samsung,exynos850-dwusb3

-- 
2.56.1


