Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795096501;
	b=ZC57DnD54veWeZgYGm/6dpdH+javFVmy3+AHY/1atZB4OBTUGClnD/iROTufoJbzJFg2
	 KKY7bXwRLAZOsGCa8cY39ztIHYA9LAbVPfv/kxScGQSpuCmNT2RHvlzKpvjvFvqOwMrcD
	 3kAapAY+kXEBGcbdBv3sqXGjKVcfCwXhCrome9aBzft4o/gZfRpctt7zQ2UUbOpodpQUC
	 qljaMJWwB8Zu5KzIrlQTtlRLszDG6Yi7Tn+BKDRc+5iY3xnH8n+GCYZR7Ef9yEu9Xq+F2
	 SMSpQDWwmltAT9xHS5MRn7tkKgzvaGMHlhvo4hX82fciezRNTVLaZiq92eqKWVRo0tA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795096501;
	h=Received:From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Type:Content-Transfer-Encoding;
	bh=ZJGtB4OP3zwXd7kRGGa7u0yAvYylX6kYVoeRdQIobdw=;
	b=qthT5T6toLMyF4sobV/cc+rk9dK0ktxbPGz8nZXkNf55+gxhebag41n8bUSgu14EmZYR
	 eE1Q0BtEgHA9xpgk/VoB9ZH4r5NIEXXx7WByB43aB8NutfPSqaPimua+Za9LvV6sVA2cs
	 9FRRQHWg5wLflf2XBE6kpcDDZZe3quXUZ0gYgvsuMlQMfNRYX7cCtRxd9m7sNqJm8Zzg7
	 M0sVc8gOJpqFwgTzP1R1bE9ccJhmrmRqxnowE/PBsyDa2tatbeQ1MAc7WB2E77lMdqhll
	 ZHcrALELF7CtEMj21vs8a/YBlM6/91OKy9rZZPchKWuwZMheZpv1YNAijw9jzR50jBQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DBF7606A324;
	Thu, 19 Nov 2026 13:55:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1921F1F000C5;
	Thu, 19 Nov 2026 13:54:58 +0000 (UTC)
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Peter Griffin <peter.griffin@linaro.org>,
	=?UTF-8?q?Andr=C3=A9=20Draszik?= <andre.draszik@linaro.org>,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH v4] arm64: dts: exynos: gs101: Drop CPU masks from GICv3 PPI interrupts
Date: Thu, 19 Nov 2026 14:54:56 +0100
Message-ID: <b1477db70b5a068c7ed3276cac906836031214db.1795096443.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.43.0
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Post: <mailto:linux-samsung-soc@vger.kernel.org>
List-Help: <mailto:linux-samsung-soc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-samsung-soc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Unlike older GIC variants, the GICv3 DT bindings do not support
specifying a CPU mask in PPI interrupt specifiers.  Drop the masks.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
Reviewed-by: Peter Griffin <peter.griffin@linaro.org>
---
v4:
  - Add Reviewed-by,
￼
v3:
  - All other patches in the series have been applied,

v2:
  - Rebase on top of commit d0298724f901d45c ("arm64: dts: exynos: Add
    EL2 virtual timer interrupt") in soc/for-next.
---
 arch/arm64/boot/dts/exynos/google/gs101.dtsi | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/arch/arm64/boot/dts/exynos/google/gs101.dtsi b/arch/arm64/boot/dts/exynos/google/gs101.dtsi
index b218ff50d228980e..5a353e73d040ebe1 100644
--- a/arch/arm64/boot/dts/exynos/google/gs101.dtsi
+++ b/arch/arm64/boot/dts/exynos/google/gs101.dtsi
@@ -1928,11 +1928,11 @@ apm_sram: sram@2039000 {
 	timer {
 		compatible = "arm,armv8-timer";
 		interrupts =
-		   <GIC_PPI 13 (GIC_CPU_MASK_SIMPLE(8) | IRQ_TYPE_LEVEL_LOW) 0>,
-		   <GIC_PPI 14 (GIC_CPU_MASK_SIMPLE(8) | IRQ_TYPE_LEVEL_LOW) 0>,
-		   <GIC_PPI 11 (GIC_CPU_MASK_SIMPLE(8) | IRQ_TYPE_LEVEL_LOW) 0>,
-		   <GIC_PPI 10 (GIC_CPU_MASK_SIMPLE(8) | IRQ_TYPE_LEVEL_LOW) 0>,
-		   <GIC_PPI 12 (GIC_CPU_MASK_SIMPLE(8) | IRQ_TYPE_LEVEL_LOW) 0>;
+		   <GIC_PPI 13 IRQ_TYPE_LEVEL_LOW 0>,
+		   <GIC_PPI 14 IRQ_TYPE_LEVEL_LOW 0>,
+		   <GIC_PPI 11 IRQ_TYPE_LEVEL_LOW 0>,
+		   <GIC_PPI 10 IRQ_TYPE_LEVEL_LOW 0>,
+		   <GIC_PPI 12 IRQ_TYPE_LEVEL_LOW 0>;
 	};
 };
 
-- 
2.43.0

