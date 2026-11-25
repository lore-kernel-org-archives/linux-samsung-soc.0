Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795618564;
	b=jJSge2uchFz+Rz50wjquiszlL59gfSOJB3O/W2ScKy6P0tzIqw8cJZRfRrD6f6FI3D0b
	 /tEwaV4uLqFP7QdF9kC13BRQINA+ef3HvQqoUw7mlBghXTDmpa0WtseWNthBSLBK07VDF
	 DZ3bo+eq5rUYh1mcEFO/Drje306gmvX+L8WLJ1XkFqTFe9cWBO/64QZESXiZSUYUuV4vW
	 WhZq6rskcLtrfOmDffBwBetGbk76ZPNrG+4CvKA9hxcwL7h5LEFcCK/sxaO8TuVsE3Hym
	 WWkQPJbtd/XNIRpqZ664tkSN7QSj/lS2n55K2g6jkgSSgkF3zivruQEM498aci+c8Og==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795618564;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=/cd+VsEs2FzLrKaZ0JDNDcQff/j0gUW6+LeqT4o7nk8=;
	b=ase34xgIfDMAsuKXOgIzsp/cWDmh7s7qjEXegU9lkO6Q4annGw8mqMHLX6v8wCa0/sfs
	 l+yO+TU4JiSoQQ0Q7EYO6eCBXBlTAK7VUbQ1q/NyOTnfPjeQOQpOOXZ19uWbWkGhJXGI7
	 uOHewcGdMGucCJovkFkBKFqkiureX8t14i2C4j02dIMSVfX3shfoBYK/9q0n3bRBAf2xZ
	 stEpqsOJJ+cu+H82tw3lrl1LOgOC3RaalZbG8s+AM0xL9Wqc0qPEFuxR8Bn5027ofyvfN
	 xq6KjSYnS/epUVy8ea1rLDEeFpdCmZH3cb7wu4vNncW2Gq/c5DmwKnWIT9398JK6D7g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=uLgqSlkC;
	arc=none smtp.remote-ip=209.85.221.50
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED5D7606A334
	for <linux-samsung-soc@vger.kernel.org>; Wed, 25 Nov 2026 14:56:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org ED5D7606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=uLgqSlkC
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-491846221ffso5051973f8f.3
        for <linux-samsung-soc@vger.kernel.org>; Wed, 25 Nov 2026 06:56:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795618562; x=1796223362; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=/cd+VsEs2FzLrKaZ0JDNDcQff/j0gUW6+LeqT4o7nk8=;
        b=uLgqSlkCyNa6YWaxVkGRsskwfv9XNjMbwjrTcQVdOsxrH7dKqDUqlH7ymEnX7y+tRx
         9xO4Ri5p+VJvq5+lPF472wv0dhuRiSeAng96wsIq4dZUApLsZaAXqh/+LH+4QqHDQvZG
         5RfqnJo/5XGZWYmLxq5/8c5EtMIadJ6miAaecgGxRz23L0J204u/sVxdQo9x/fW6BU0b
         3jtZZ1QIn+b4CNordEVQRv63LP0raB5lTp4QFgz3hT8QfurcBNNalQEaW3Om+D54tJif
         yi7DwSqiWz+vffoj2QC7RMNugLi2V03yg4x92QxaPQJZDrJDA7AFbZLEAuRUDdObei35
         9maw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795618562; x=1796223362;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/cd+VsEs2FzLrKaZ0JDNDcQff/j0gUW6+LeqT4o7nk8=;
        b=lN7qr+IBiOyV4e0JDImd8IoVUyWfiJkcPK5SGXYLNTJ3FAG90vXUkI6HCA7x9KhMBh
         Wms5vZIvEqpfOYy94Wh9InexqLF+GU1SMOHB1+9DH6/LYtZWOWio1EKMF3a+Lx7jC3s0
         5kYrdn6RouqFswxlGXsbm3ERL+4vQT/nb+iLnfIc44bsHC3xBbZqecHEwThmzHe8/8Fs
         8CmFF4ysVntsfZZGVx7RJ7Q81p2kSndwGJjleESeUeeXzkyPWP+pzIi/gQ5wJ5k17QRf
         oEJp1a/KL8+nsyYin39rHy1aFx4ajyuago9WpsNexswYwBKl2xf3IKhvRi/jvNLlnQSx
         k8MQ==
X-Forwarded-Encrypted: i=1; AL+hErF6nYV8kgQYvCEYLWv6cs24aN9H+bYfTbkhaVk2ElqDmvsLWNBQsEnl7Gts0dBPPidtlnMD4oj4gUeCDKbuHNFAhA==@vger.kernel.org
X-Gm-Message-State: APuU4Z+xYTWC6UYWNmQcPEh6fUbmNstcwiyzymWG0fJQolYxMihBcLiu
	GzZiONOOe07bdVQuC7E8aLera+C+Ou6jea1QD3NWqswwotlK5LUp8Ebx
X-Gm-Gg: AZFdTZf5og1A6LczDsU4xlkGMQionbugApfDRJ8nO4ySzH727PAS96PQLEnQG/fIzTx
	N9602Yj/Bft/WmZWhZ/xFeumSxLoC8QDjIOGF7NP82qvWQoUaHVZSJ6jQebib6b5VoDV0I5wgIA
	LT6z2BFyAMTIX3/gae9G6sctU1l0UiVOWoBBLy61T00SOu0F1Zu9xeJKk440ZNjkVImCAsxi71t
	OhSd8MVmL8n5J7yEqBe/+5xNrg9SsE4Z645wfHcorWfFAcJiFEA0LWraVtwstxRITHLi8BRjh9G
	sWf3EY/MOUFHlblyFoXrpntO1XZkieWfFYw4epZhxq9wyy1zsqWSe4SFBp4Udx2Xiql5alFRH2U
	QxCy9G089fY3rhmYMFzVxZsjjrTkfe18oTecgSQkPK1S+RHDWrbaGcsv4flfv5vrcymm1WTcoEb
	/pSB0oQaXB6uFfbPv39XI6Dbvv88qI3EUChOYxONqOPHHKnOort/vw1mpIkK8ZgzQ3oPv/+myP3
	36CWR7yT7TIiw+iVcll7TKdDKMBDF+EawSZ9CG0pJbWffpr/FNSSHNxlfuMFCmqaTKuW2GsCtym
	ez/fkhIAUEaTf1kYz7iTm3yOUXJfnrcglqzW0fJz9Qv7Zu2C1VTaVl1Dwe0gSVUDPKcPm+m6ENC
	WG3Ymad2uDU3fj83AuBHeOoVfiGd5qu4wrA==
X-Received: by 2002:a5d:6f07:0:b0:48f:fcac:a5e2 with SMTP id ffacd0b85a97d-4abb47b243dmr33442304f8f.38.1795618562038;
        Wed, 25 Nov 2026 06:56:02 -0800 (PST)
Received: from DavidArch.internal (catv-78-139-0-46.catv.fixed.one.hu. [78.139.0.46])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-4ab6b10b2c9sm36036139f8f.31.2026.11.25.06.56.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 06:56:01 -0800 (PST)
From: David Virag <virag.david003@gmail.com>
To: Vinod Koul <vkoul@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Peter Griffin <peter.griffin@linaro.org>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Sylwester Nawrocki <s.nawrocki@samsung.com>
Cc: linux-kernel@vger.kernel.org,
	linux-samsung-soc@vger.kernel.org,
	David Virag <virag.david003@gmail.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-usb@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Umer Uddin <umer.uddin@mentallysanemainliners.org>
Subject: [PATCH v3 0/5] Add USB support to Exynos7885
Date: Wed, 25 Nov 2026 15:54:51 +0100
Message-ID: <20261125145458.2594179-1-virag.david003@gmail.com>
X-Mailer: git-send-email 2.56.1
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Post: <mailto:linux-samsung-soc@vger.kernel.org>
List-Help: <mailto:linux-samsung-soc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-samsung-soc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This set of patches adds support for USB on the Exynos7885 SoC.
 
The Exynos7885 has a DWC3 compatible USB controller and an Exynos USB
PHY that theoretically supports USB3 SuperSpeed, but is not implemented
in any known device. The vendor kernel also stubs out USB3 functions, so
we do not support it.

Changes in v2:
- Clk changes not included as they are already applied
- Add Reviewed-by: tags where appropriate
- Use samsung,exynos850-dwusb3 fallback compatible for dwusb3
- Use unsigned long for set_ref_clk_rate
- (from Umer Uddin:) Error-check clk_set_rate, and fail if returns an
  error.
- Keep dt nodes ordered by unit address.

Changes in v3:
- In exynos-dwc3 dt-bindings, use an enum with the exynos990 entry to keep
  the exynos850-compatible entries together and keep code clean.
- Add Tested-by and Acked-by tags to phy driver support patch.
- Move maximum-speed property to device dts.
- Move status = "okay"; to the bottom of the usbdrd node to statisfy
  dt-check-style checks.

David Virag (5):
  dt-bindings: phy: samsung,usb3-drd-phy: Add Exynos7885 support
  dt-bindings: usb: samsung,exynos-dwc3: Add Exynos7885 support
  phy: exynos5-usbdrd: support Exynos7885 USB PHY
  arm64: dts: exynos: Enable USB in Exynos7885
  arm64: dts: exynos: exynos7885-jackpotlte: Enable USB support

 .../bindings/phy/samsung,usb3-drd-phy.yaml    |  2 ++
 .../bindings/usb/samsung,exynos-dwc3.yaml     |  4 ++-
 .../boot/dts/exynos/exynos7885-jackpotlte.dts | 28 +++++++++++++++++
 arch/arm64/boot/dts/exynos/exynos7885.dtsi    | 31 +++++++++++++++++++
 drivers/phy/samsung/phy-exynos5-usbdrd.c      | 26 ++++++++++++++++
 include/linux/soc/samsung/exynos-regs-pmu.h   |  3 ++
 6 files changed, 93 insertions(+), 1 deletion(-)


base-commit: 5d7b9f865597a74b323d512619c42f3e07ae043a
-- 
2.56.1

