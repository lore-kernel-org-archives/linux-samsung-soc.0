Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795794459;
	b=GkgSN8IsZgapg9OoVtsMFUxCW/kHyW01Eatsls0X5Y0nZ7GDOk5vM0WKfAl5L/7pKywb
	 jCqxNRGgZ5ctjvdxUgq2pz4kgV9e6SmU2IYvma5i1hzniOuOOCamYa9yJU2sQ93mg+7ST
	 +g2u7rsOX01Qgt+Tsv+IYg0Fw1OFKWg5elyCVVSpuJ0g8uEw2mse0+R0yv4QrmnUass8Z
	 zre5WPU6dBllq7XIua7H/6ovrpiwMp7wx3D2RMUjdgNNrJ/N1z9sPup3KIrmjh6Rtm0A3
	 ZKDkEFwp7vonDELP/a87mIe0yawatCoJ7tZwx6fxAJ6CZsyAhdvCVoq+0OyIZIwQ/DA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795794459;
	h=Received:DKIM-Signature:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Subject:From:To:Cc:In-Reply-To:References:
	 Date:Message-Id:X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=O8pnsdU3vMqGq7ELmjvq5FdeahOXIlHE/MoodaIfQgo=;
	b=rFogE9VsLBLBaI+a6vese8OdkT+QgLcuS6YprDDP9i2gz2ci0et0uYc+RX1i7e90Hgpd
	 apHhZePflY+3YRMq5OT47ZLw2ynm/aKE3zePkhUyJrual/3Xkh/ENJDbxVarLeLj3glES
	 EvVMfH+/IaFI+EeuNZAWp/8TBprulPMoPUUzZ3nOZgFu4Kb6pZQbTLA/chnQcP0oH0sb4
	 f2GIa+o4QqZ7mQaTrC1MqUM6jjveYgaL4U/Tdrjs1tsB8IrTpeBkhduGUufWalpzLpAZX
	 SQT1Gud21XYGmyGK7Jw6nJCWrh/d4KjmPJpiO0RITCvnENuuAJpRbbxhH5NMPnaqvfg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=iWSl5ikj;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17879606A31C
	for <linux-samsung-soc@vger.kernel.org>; Fri, 27 Nov 2026 15:47:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=iWSl5ikj
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 07BA51F0089C;
	Fri, 27 Nov 2026 15:47:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795794458;
	bh=O8pnsdU3vMqGq7ELmjvq5FdeahOXIlHE/MoodaIfQgo=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date;
	b=iWSl5ikj8sFU5KxMqaRSyhp7KVRgAMSiocSR1PLgEVzvwIfi4WCTyC0AigbNbupxF
	 gJHu3oNouhMl/rozFT5q4DpadukydxjvgLsAn2pfa4KiYPOwYERt3D5DtxL/H5eGO6
	 H2ypwzUHz7l4x3T3Qi7S8YWzVzW5nk5Ko+Eba83/Ak61NBoOlR6Yqqt3GLJzmRv9Hl
	 2WjAbdGqS3VRu1H43sqX0lFv8k1EMjLxd4DWnnrIdnph3RdCG87cseWTF9cpI2ate3
	 bCOuvgVH14+PLMtpS8/zHsR25ax1GI+Rl5BodzdG1TKv4KTIBsf9Z71uJF0PEk2XKE
	 bHSvfr+cLW16g==
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
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] phy: phy-google-usb: reset USB3 PHY before init
From: Manivannan Sadhasivam <mani@kernel.org>
To: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Cc: Peter Griffin <peter.griffin@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Manivannan Sadhasivam <mani@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, RD Babiera <rdbabiera@google.com>, 
 Neill Kapron <nkapron@google.com>, Juan Yescas <jyescas@google.com>, 
 kernel-team@android.com, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, linux-phy@lists.infradead.org
In-Reply-To: <20261119-lga-usbphy-init-v1-1-1de4e0e6b191@linaro.org>
References: <20261119-lga-usbphy-init-v1-1-1de4e0e6b191@linaro.org>
Date: Fri, 27 Nov 2026 21:17:30 +0530
Message-Id: <179579445030.13164.13282265230853414841.b4-reply@b4>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2306; i=mani@kernel.org;
 h=from:subject:message-id; bh=fnovCDIUZdtvw2vTP29UBKPpf7kuHTKrlAWxg8QfSxM=;
 b=owEBbQGS/pANAwAKAVWfEeb+kc71AcsmYgBrCaYV3UsWw1F2M3UeRNjFwQqz9XcGW9J7j0s1V
 lc6og/PmOiJATMEAAEKAB0WIQRnpUMqgUjL2KRYJ5dVnxHm/pHO9QUCawmmFQAKCRBVnxHm/pHO
 9cd4B/9OuKmRIaV82B7CID7lApzBQDZSTm72kOMba5g28fwiBJ2mejOrdOYOorpUAIByv6Hz/4I
 WRxd71gfqT2sIm5fqU97Duwr298JHwIlBHiiqCdclMBEqnC5Hsdg5ckzzjpj4tj0C6/H44Rc3eJ
 v7b+QjT7xDBXR0ROUutXjAbgNjHAHXnyVPNuKLdja7VxmcURAvbVRhUoV4pUEFDhI6qXwVXrLK4
 PT/sjsFp2+PoVfR/cJKHdcLaOUBfuhlRttgj4CTiBr28i6CilTF+aDCWRKCpgmv/pk1G0Yirejp
 L+YvrHuVmafbq5yrtJinIANoZMtnqzPAHyqEBIZZo+Dy/Rdy
X-Developer-Key: i=mani@kernel.org; a=openpgp;
 fpr=C668AEC3C3188E4C611465E7488550E901166008

On 2026-11-19 10:47 +0000, André Draszik wrote:
> google_usb3_phy_init() assumes that the PHY is in reset and that the
> Type-C Assist (TCA) block is in its power-on state. Neither is the
> case when the driver probes for the first time on Pixel 10, where the
> boot loader has used USB before: the PHY is out of reset and
> operational (lane0 phystatus is low right away, whereas it takes about
> 12ms for a PHY that really was in reset), and the TCA has been
> switched to USB already (TCA_TCPC reads 0x1).
> 
> When the PHY is initialised in that state, the soft reset of the DWC3
> controller hangs in about one out of four boots on blazer (Pixel 10
> Pro, 12 of 50 boots), with DCTL.CSFTRST still set seconds later:
> 
>     dwc3-google c400000.usb: DWC3 controller soft reset failed.
>     dwc3-google c400000.usb: error -ETIMEDOUT: failed to initialize core
> 
> In addition, google_usb3_phy_power_on() waits for the TCA to report
> that the transition to 'no connection' has completed. The TCA starts
> that transition by itself after a power-on reset (TCA_TCPC resets to a
> request for it). Without a power-on reset there is no such transition,
> and the wait only succeeds as long as the event is still pending from
> earlier. Just asserting the PHY resets before initialising the PHY is
> therefore not enough: the event was gone in 8 of 32 boots then, and
> powering on the PHY failed with "PoR->NC transition timeout".
> 
> So, before initialising the PHY:
> * assert its resets and drop the reference clock request, which is the
>   state google_usb3_phy_exit() leaves the PHY in
> * clear the TCA's events and request the transition to 'no
>   connection', so that google_usb3_phy_power_on() waits for a
>   transition that this initialisation has caused
> 
> The resets are kept asserted for 1ms. That is the duration that has
> been tested, not a documented requirement.
> 
> With this, USB came up in 20 of 20 boots on blazer, and in 25 of 25
> re-probes of the controller (unbind and bind of dwc3-google).
> 
> Fixes: 8c2b331e6327 ("phy: Add USB3 PHY support to Google Tensor SoC USB PHY driver")
> Signed-off-by: André Draszik <andre.draszik@linaro.org>

Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>

- Mani


