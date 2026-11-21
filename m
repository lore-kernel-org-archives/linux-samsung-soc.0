Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=85.215.255.84
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795251721;
	b=VieVhL7fgFzEIbYyrWxkhwYHeUdWGsxZlaDJbh317VeSs2Bz4IBwK2ejvSGe/h/kbgCC
	 kR8HqejhNW3hvcREAl7jxoxQd1UOeylyuo8k0gFecNmlDDSOTngZp+uBh5LdMaIii9rly
	 8ut46e9M1oJyaznMA1xmXpXwP9VSI/eFVY54hgrluTWuhjfQ1yqZochFSspf4PHSpso33
	 EAIx8iNhsmS/zAgA/dix9ELuG9PK6oVfnzCYQE+eK9taLhFiuB8bO8Km99nTBAWoxevkN
	 18M1pLuJqRN1YPqQFfs4peis1WmJUQENR/rZJmxFMIkLOxrNDZz35LkNicKIfWcf2AA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795251721;
	h=DMARC-Filter:X-RZG-CLASS-ID:DKIM-Signature:DKIM-Signature:X-RZG-AUTH:
	 Received:From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding:Content-Type;
	bh=VGhk0eu+tXMD+asf0/nI/BtBPlGALoxWk6usb0EuYYQ=;
	b=4V4WyT4zRDWCT11gfJl9oWk6iLOd473UPJt7Br7aCvStkJgPuzQzhG7yfCa5Ow47Jzjc
	 qfEbWEa1h0VNg9y0U7yjplkSZHdQ9AhTeW8XzAXlTiLxYaKxuv4hXPCtRflDuNNqjoIhQ
	 0yqvZQLnrr2SUCJTSQW90HXOIMah74oI4035xDMmJjMNCK/RWQZsJsb8W3Jm3wljxw0pF
	 aMqPUoc1MG5IuXauwSmpFVKJ6UQkl40zBRQi/DMtD/qp0fcxqs3sENF0RaMxyJ7/xxUyV
	 R5ATZCkIZgDKjLgUgqtZp9VTsGDDsrLP9xUSQPn/ZAu5xSW9hTaWl5sDN773kkM8dXw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=ommer.net;
	spf=fail smtp.mailfrom=ommer.net;
	dkim=pass header.d=ommer.net header.i=@ommer.net header.a=rsa-sha256 header.s=strato-dkim-0002 header.b=eo9Y7JmC;
	dkim=pass header.d=ommer.net header.i=@ommer.net header.a=ed25519-sha256 header.s=strato-dkim-0003 header.b=xo9xremy;
	arc=pass header.oldest-pass=0 smtp.remote-ip=85.215.255.84
Received: from mo4-p02-ob.smtp.rzone.de (mo4-p02-ob.smtp.rzone.de [85.215.255.84])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2BC9606A68B;
	Sat, 21 Nov 2026 09:02:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B2BC9606A68B
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ommer.net
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=ommer.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ommer.net header.i=@ommer.net header.a=rsa-sha256 header.s=strato-dkim-0002 header.b=eo9Y7JmC;
	dkim=pass header.d=ommer.net header.i=@ommer.net header.a=ed25519-sha256 header.s=strato-dkim-0003 header.b=xo9xremy
ARC-Seal: i=1; a=rsa-sha256; t=1795251712; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=LRF3RLiNqT2WXPLbtovvo2Y3W0LAZ6vo6IYPQ5oCZbWdKy5o6j1yB8fkqg5zCDdKXs
    E3TNKUZ7z+ZYG1lt5IQ0ibb7so805phOt0UVtpRdslWtTBlliV4gPVmti/ZTQwhshShD
    uCjJhtO1RUZBrs5uD7IoqzgkgFUbi/GgRMEDKtHPsDdPfkoDYMK86r1nmygkX/KARzsW
    HWZr02GGKiS2LCoX+bAFSri7S+RNoBFdhXn/yV5UsU7zvrByNVQxr9PBr/t9LQgVCJq+
    30pRsdy2WUcIZ/0NLNm8Cu3003aI2brMejKMfs9REbsL5Aa8xfLLUGUT8eQyt8jegTTD
    D/8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1795251712;
    s=strato-dkim-0002; d=strato.com;
    h=Message-ID:Date:Subject:Cc:To:From:Cc:Date:From:Subject:Sender;
    bh=VGhk0eu+tXMD+asf0/nI/BtBPlGALoxWk6usb0EuYYQ=;
    b=fxpDRLsngyBzj0HkJ0mYW7e6o8rxWpKSwacKeKVdLB0uvWsxZzidjGpGslOyjIriyk
    mH7kqxNuVxWOfK9kPf9PtK7wSudnRHBomvGAQYEYoqaryPW9JbQmKkLJ1I3CLDX1FB42
    bozctZVK1oV3MY11Q7Hjot+S9hqmdC++SsBu3LozxklMlYU7fN/Y1Fqv6afga332PyDN
    x69PjPgS08vnhh63YLniF77SGWR50w/+Kx7+gtHIchFTDpIMyobCvmJEQ6gjxBVtMDTv
    abTTCGbZRa7+i4BFON4umin9DdyTCmetTcAPyL03REQNKin8HvAJg+ojY6o4JOuYuZnF
    uY3w==
ARC-Authentication-Results: i=1; strato.com;
    arc=none;
    dkim=none
X-RZG-CLASS-ID: mo02
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1795251712;
    s=strato-dkim-0002; d=ommer.net;
    h=Message-ID:Date:Subject:Cc:To:From:Cc:Date:From:Subject:Sender;
    bh=VGhk0eu+tXMD+asf0/nI/BtBPlGALoxWk6usb0EuYYQ=;
    b=eo9Y7JmCzWLxt0DfpEzsvdHnzR+kaGKRJFoahgRoydSko8tFpxPrk0HM4CEMd4oVco
    7N9hQz84ffxUUTNsMA4+iw1Axk4f4lACUei1w/LdcA5w7DDR9Q05ScryDNQ6ZLSczAeF
    PxzvWS4xpLNqEhhcyIE3WXFI6WRO4o7p/UXIfERkCtgq4LZ9y3wGlrOVEO8VWAvYwBH9
    fWTVqu4w1CeCD/WV5olez9Pp3Jx9G59bs/eXpvIwo0jxmOXlkePtmI5DdGJwvCdxwU8s
    FRf1mC2HoTuOm+I0Blc/sOnZpTZLirZyE8dgjgwVvELLVD/0upmBBjcPhwSnl58kGXwX
    dG2A==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; t=1795251712;
    s=strato-dkim-0003; d=ommer.net;
    h=Message-ID:Date:Subject:Cc:To:From:Cc:Date:From:Subject:Sender;
    bh=VGhk0eu+tXMD+asf0/nI/BtBPlGALoxWk6usb0EuYYQ=;
    b=xo9xremyOyhhkTvD+mbjPcZWXaqBZqFIGGWkNJAH8b9MLjfeWLYxlElRZXJQd0ovOd
    xXMoK9Is8VWQ1BMidfCw==
X-RZG-AUTH: ":JGkKZ0mIdPJLfj3rk5MOrv6kH/tvwFubxUqMvsWOyVXJkOABZnPqvKUstHY8FQgi4y8Fiu3j5HL2zuVyTQ9NDYXzNSFFaQ=="
Received: from localhost.localdomain
    by smtp.strato.de (RZmta 55.6.3 AUTH)
    with ESMTPSA id n2f42d2AL91pVCA
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
	(Client did not present a certificate);
    Sat, 21 Nov 2026 10:01:51 +0100 (CET)
From: Henri Ommer <henri@ommer.net>
To: krzk+dt@kernel.org,
	peter.griffin@linaro.org,
	alim.akhtar@samsung.com,
	robh@kernel.org,
	conor+dt@kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Henri Ommer <henri@ommer.net>
Subject: [PATCH v2 0/2] Add Samsung Galaxy A20e support
Date: Sat, 21 Nov 2026 10:01:44 +0100
Message-ID: <20261121090146.39170-1-henri@ommer.net>
X-Mailer: git-send-email 2.56.0
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
Content-Type: text/plain; charset="us-ascii"

Hi everyone,

This patch series adds a device tree and a dt-binding for the Samsung Galaxy A20e.

I verified the device boots into a LightDM login.
The device tree was tested with the device tree style checker script, which resulted in no warnings.

Signed-off-by: Henri Ommer <henri@ommer.net>

Henri Ommer (2):
  dt-bindings: arm: samsung: samsung-boards: Add Samsung a20e
  arm64: exynos: Add support for Samsung Galaxy A20e

 .../bindings/arm/samsung/samsung-boards.yaml  |   1 +
 arch/arm64/boot/dts/exynos/Makefile           |   1 +
 .../arm64/boot/dts/exynos/exynos7885-a20e.dts | 123 ++++++++++++++++++
 3 files changed, 125 insertions(+)
 create mode 100644 arch/arm64/boot/dts/exynos/exynos7885-a20e.dts

-- 
This second version of the patch fixes issues pointed out via sashiko:
- Memory size
- Dt-bindings commit message (binding mentioned twice)
- Remove bootargs
- Correct eMMC slew-rate
Best regards,
Henri

