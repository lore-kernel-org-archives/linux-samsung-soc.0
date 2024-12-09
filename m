Received: from sendmail.purelymail.com (sendmail.purelymail.com [34.202.193.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3513A215074
	for <linux-samsung-soc@vger.kernel.org>; Mon,  9 Dec 2024 08:02:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=34.202.193.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733731325; cv=none; b=otg/VI8MOIFHZ0J9JvZc64KQZlD6QgFD7iS6VJBQ5BD0oGSdZkjLu19WEzhxg8aa/QdJcstvcOQOO3Xkcb9zIFn17pcQY08ol/XrAbE8NlaZZJ6S/0OB0zmlAxu4grOXeeyg3WuP4/T2KBeiIvLBUTGclDJO1kuX2uLUe9J1eaI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733731325; c=relaxed/simple;
	bh=xv0g/k5RohMn5AP1WL+DpPUxCREfDHDlRdXwBYsOnJg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=XTK99ORIHmHacHz3EK12bsr7B8WIXyYZcsX3HQXo3Af/Woh76dcm47sKjBYUVUDg9Jhz75OiuTwG6LDtuVI6h1ltYd0jkmTxjoiHOrvm0hb2gv8VbZEUU9LKMsyOLrySaWrtns/rjIzjy5IqyLzvjPVllqn0FynuLu+MNiWS5Ew=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mentallysanemainliners.org; spf=pass smtp.mailfrom=mentallysanemainliners.org; dkim=pass (2048-bit key) header.d=purelymail.com header.i=@purelymail.com header.b=OXz1EUhf; arc=none smtp.client-ip=34.202.193.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mentallysanemainliners.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mentallysanemainliners.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=purelymail.com header.i=@purelymail.com header.b="OXz1EUhf"
Authentication-Results: purelymail.com; auth=pass
DKIM-Signature: a=rsa-sha256; b=OXz1EUhfInN9iA8Qq++xZZ2u/3bfsrwlgrF0O1AKDGKfOx6o2IxkbV25Q0o/baYg6X8lbnd43Ajj66GqgLc8LSbE/rBx6mw/B+mnh9GZ3YawQSXuPK3GEk08d9jTnFRxyzR2jsKdqPcgi73I7k2frZ/cj8xD0sH4gzScKnNvwXUIyyaQqHF5wCGGKa18H9rKTrv41Q35QdSKD3dZ9hVLA2WaAiDR+avWsf7tEJICykxjzQCXwcMYKIr15V+KT5j7zPyFt6wQz+11lakrtwhsepEq2yQOUYFbfaTktie5nSWQPwDXOoXW1p7VVAUxwtOn8VEal2A3Xv7JWkhd3IgJ6A==; s=purelymail2; d=purelymail.com; v=1; bh=xv0g/k5RohMn5AP1WL+DpPUxCREfDHDlRdXwBYsOnJg=; h=Feedback-ID:Received:From:To:Subject:Date;
Feedback-ID: 68229:10037:null:purelymail
X-Pm-Original-To: linux-samsung-soc@vger.kernel.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id 1477585645;
          (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
          Mon, 09 Dec 2024 08:01:11 +0000 (UTC)
From: Umer Uddin <umer.uddin@mentallysanemainliners.org>
To: Krzysztof Kozlowski <krzk@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	igor.belwon@mentallysanemainliners.org
Subject: [PATCH v7 0/4] Add minimal Samsung Galaxy S20 Series board, SM-G981B and SM-G980F support
Date: Mon,  9 Dec 2024 08:00:55 +0000
Message-ID: <20241209080059.11891-1-umer.uddin@mentallysanemainliners.org>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by Purelymail
Content-Type: text/plain; charset=UTF-8

Hi folks,

This series adds initial support for the Samsung Galaxy S20 Series and also
initial board support for the Samsung Galaxy S20 5G (SM-G981B)
codenamed x1s and the Samsung Galaxy S20 (SM-G980F).

The S20 Series feature a lot of similarities in their configuration
and internally Samsung named the common devicetrees in their
downstream kernel 'hubble', please note hubble excludes the
S20 FE series and Note20 series. To accommodate this, I've
now named the device tree common's matching the codenames
(x1s-common).
The device trees have been tested with dtbs_check W=3D1
and results in no warnings.

This initial bringup consists of:
 * pinctrl
 * gpio-keys
 * simple-framebuffer

This is enough to reach a shell in an initramfs. More platform support
will be added in the future.

Just like SM-N981B, the preferred way to boot the upstream kernel is
by using a shim bootloader, called uniLoader [1], which works around
some issues with the stock, non-replacable Samsung S-LK bootloader.
For example, the stock bootloader leaves the decon trigger control
unset, which causes the framebuffer not to refresh.

Device functionality depends on the patch series from Igor Belwon:
"Add minimal Exynos990 SoC and SM-N981B support"

[1] https://github.com/ivoszbg/uniLoader

Changes in v7:
 - Fix old reference to hubble-common
   in x1slte.

Changes in v6:
 - Fix indentations in dts makefile

Changes in v5:
 - Fix dts makefile order

Changes in v4:
 - Rebase from krzk's kernel tree to accommodate
   for the merge of r8s
 - Rename exynos990-hubble-common.dtsi
   to exynos990-x1s-common.dtsi

Changes in v3:
 - Fix oversight in yaml
 - Decommonise memory map

Changes in v2:
 - Add Samsung Galaxy S20 into device tree bindings
 - Add support for Samsung Galaxy S20 as well as the 5G variant now
 - Fix typo in Samsung Galaxy S20 5G commit message

Kind regards,
Umer

Umer Uddin (4):
  dt-bindings: arm: samsung: samsung-boards: Add bindings for SM-G981B
    and SM-G980F board
  arm64: dts: exynos: Add initial support for Samsung Galaxy S20 Series
    boards (x1s-common)
  arm64: dts: exynos: Add initial support for Samsung Galaxy S20 5G
    (x1s)
  arm64: dts: exynos: Add initial support for Samsung Galaxy S20
    (x1slte)

 .../bindings/arm/samsung/samsung-boards.yaml  |  2 +
 arch/arm64/boot/dts/exynos/Makefile           |  2 +
 .../boot/dts/exynos/exynos990-x1s-common.dtsi | 98 +++++++++++++++++++
 arch/arm64/boot/dts/exynos/exynos990-x1s.dts  | 28 ++++++
 .../boot/dts/exynos/exynos990-x1slte.dts      | 28 ++++++
 5 files changed, 158 insertions(+)
 create mode 100644 arch/arm64/boot/dts/exynos/exynos990-x1s-common.dtsi
 create mode 100644 arch/arm64/boot/dts/exynos/exynos990-x1s.dts
 create mode 100644 arch/arm64/boot/dts/exynos/exynos990-x1slte.dts

--=20
2.43.0

