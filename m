Received: from sendmail.purelymail.com (sendmail.purelymail.com [34.202.193.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E94CD17A597
	for <linux-samsung-soc@vger.kernel.org>; Sat, 14 Dec 2024 12:00:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=34.202.193.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734177638; cv=none; b=Egp3otFJK8MdifZuqUzg9CNO9A6IrXrg9XirhHY58t1mvluGnRBZGDeHeC5c9lbue1V+CsasjIkc/RhLZVDig0Z0gtsf88h+ZhGx+BCQqiDTGa8WCYMkH/9PMrEScAEQotdwk5SA5fq4fuMiTYH/QX5xPIT8okIeRMjIQRw7ZqI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734177638; c=relaxed/simple;
	bh=tYG9ihl5L+qiU8A5BMBzAn0oMBT4lU9q+EivAoC0UmA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=ujGmRNnpDQk1iTJUsZc6RLwvnc8+Bfa8JRJs40u/aUCU6WRjrZCh5AYJnYuloRwh+bK7Y1vWUR3UGuYlk8W25CYmOc7cK2p03KTTfiC71iaX7vpV1VcTWLE1252v8TarrsU0ucUAYmvuKgo4TsrE7Rzk1eZ0cTJTjO+RJ1t//bU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mentallysanemainliners.org; spf=pass smtp.mailfrom=mentallysanemainliners.org; dkim=pass (2048-bit key) header.d=purelymail.com header.i=@purelymail.com header.b=RI1yoT5k; arc=none smtp.client-ip=34.202.193.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mentallysanemainliners.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mentallysanemainliners.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=purelymail.com header.i=@purelymail.com header.b="RI1yoT5k"
Authentication-Results: purelymail.com; auth=pass
DKIM-Signature: a=rsa-sha256; b=RI1yoT5kvuyVdZxUgRkJ7lgGLvj6bbZedA2OR1KhcLFCodlvHEUouHgtcaJQt44E46FMBXgd1rrd3j2PsFPFoTxRG/8b6PhftLaPgsfyV+nGYMyYDAjze8oroC14Er+8BGXJz5Pg9df8CNqIn/duGBzef2t8GmPJ16YzP8sX7doYxZVPE68Ai8SjOgAfy7hta2QEYkF8NvERQCv+c/yVPeu/7+gRiDrJOBr7V6CSD86ejxlHGBeide0tI3uFcld04QEdu+nTAr1Pdtn7dbjK3p/+Y44paomPQUZmXxzIyHlEHVwX7RJaQ5XJuu/rMdto5inSkArQFpeC0HVFc0G+zA==; s=purelymail3; d=purelymail.com; v=1; bh=tYG9ihl5L+qiU8A5BMBzAn0oMBT4lU9q+EivAoC0UmA=; h=Feedback-ID:Received:From:To:Subject:Date;
Feedback-ID: 68229:10037:null:purelymail
X-Pm-Original-To: linux-samsung-soc@vger.kernel.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id 770029855;
          (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
          Sat, 14 Dec 2024 11:59:05 +0000 (UTC)
From: Umer Uddin <umer.uddin@mentallysanemainliners.org>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>
Cc: devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	igor.belwon@mentallysanemainliners.org
Subject: [PATCH v1 0/1] arm64: dts: exynos990: Add m5-pmu
Date: Sat, 14 Dec 2024 11:58:54 +0000
Message-ID: <20241214115855.49138-1-umer.uddin@mentallysanemainliners.org>
X-Mailer: git-send-email 2.47.1
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by Purelymail
Content-Type: text/plain; charset=UTF-8

Hi guys,

This series adds support for the mongoose cluster PMU in DT via
a compatible for it that was recently added.

This change was tested on my Samsung Galaxy S20 5G (x1s) and is
confirmed to be working.

Kind regards,
Umer.

Umer Uddin (1):
  arm64: dts: exynos990: Add a PMU node for the third cluster

 arch/arm64/boot/dts/exynos/exynos990.dtsi | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

--=20
2.47.1

