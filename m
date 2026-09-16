Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 200B64DE712
	for <linux-samsung-soc@vger.kernel.org>; Wed, 16 Sep 2026 20:46:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789591624; cv=none; b=oxYQExiwOmGWLOp7DRgtrHBtTbphA3bTOdP5zEaolrBGrKxBRZvbYcSXs8OsMlXndnkUFafq/7H+D7vnqybGJZ2jNG99PsftSIhYRBqxvfdQ/UtMvtMCpYPBtryyOt8kaIeU37ypiLy/iHhwfZK/K7Je3TYTLogMQOnqqo4OdVM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789591624; c=relaxed/simple;
	bh=+39inuOtk6dvWrV4F97ZO+lWq6rs7jFZ3XYSkUU3Fnc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=pTow7vNVUvVeGn+P0ntzGEyfwCrBMijXOoUmxyW6J+XZ/tJUaeg/kYnKxZgzD8Z9ITvsE7uv676lyXH+EUM9HPy5sra+SvkAiyu9GKyBMUHXzGpIxKiZqwLL5MtNvTLKrRi+t1OtMhRl1YQeI1x7o/b+egJVm9PicOyED98Jwds=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bX9DUS2G; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=EjRbgx8f; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bX9DUS2G";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="EjRbgx8f"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68GFeUD71855070
	for <linux-samsung-soc@vger.kernel.org>; Wed, 16 Sep 2026 20:46:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	V54WJAF4OpAFQCcXdZBPujT7oaJ8xChgOl60kdfl5GU=; b=bX9DUS2GlI05Y86Q
	kdhui64lbpu1Zs+aZ1wn10HsmoC8AtwiDUkUoYoGtrMukztcxO/8hl5cJ9Jki8vT
	EWt0aKr26djOKX0tmcenInvAylVk3B5jY1cugcEb2AbKDZQqM1WN5syWxVrxxs9O
	i0wlkmRzNpHDKijVjinWZCzje+9eNFGTaIRfGgsO061Aig9QCbFhmLuzFbaLw46T
	3K8de543CQWFc/zbwTi8FGcWX7SBqevVV9UBzINXEv9087o+faYbv0RP1B3lEsQa
	q95NG2gtWPMOkevhDQT3T+i26W5Mn7aEwX0hCt0hT/ArQ6q5/z65V6wzxGRcjdba
	l6z26g==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gqqp3u64y-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-samsung-soc@vger.kernel.org>; Wed, 16 Sep 2026 20:46:44 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-936e393061dso12168485a.2
        for <linux-samsung-soc@vger.kernel.org>; Wed, 16 Sep 2026 13:46:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789591603; x=1790196403; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=V54WJAF4OpAFQCcXdZBPujT7oaJ8xChgOl60kdfl5GU=;
        b=EjRbgx8fnltiR5TqLZPSBo0PBd4YI1KfOX8hYBBG9b+q20gpTdYVByXlXRBe26VyBq
         dmuvkmkrlMyPZUxwF6288WaUPLz3eHnyQmKo+SbE1vSgzSisskVlD3n0WqlAocEHiwUg
         NWHgzGuvJQ5kEeRJ0iLZyZz5DlEnn7CroYALn8YKQG3dHt4lkCHSItGOP6VWTtFaRR5a
         lJ+zBRY/H4hw5+oSVT3IpIQqdeyQlg22isa1KIJN68RC0Ayf5NfnKAzsQ4xC47Bt7tio
         W3GCOH7Vebl7W0WVjauH4SobYxTy148zOldbqHIo3ZynrkJP/uLr1oYmdRIqufTqHN4B
         Khnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789591603; x=1790196403;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=V54WJAF4OpAFQCcXdZBPujT7oaJ8xChgOl60kdfl5GU=;
        b=QN19nK0E8GwJ/j6oX0RRyfDaz50u8fTVH05zwipJ0N0vk9j9Sf+xn+JPZYqS6MKYA3
         KI44EUC5VHEzucwKI2znnDzi367+Tdcb+j9vj83QEdQWJFnF5nEjvnzNXQTrnmk7xoil
         KCZDlEUVOWUub6qoL72/N02FdlXMsjtSYbWoaqgQRz0B90IZRGy00ajrXXa0nL7I+YuU
         z7d/3LKJrDzJyNsnZ4qWQM7jrK0HGd4+sidMgxcPg1MDB+MLOhAFY6ZY9dowB/Y+ashN
         KpG0yp+pozFKtLoLWdat7R3xpnd3UBvX3kndqtIbhkBMaVlwWW6ZLNTD1uPa9l/8MC8j
         Au8g==
X-Forwarded-Encrypted: i=1; AKwUvBzRN//jLRxaqo4SWxYyketBmqN5lbBf94c1Iqt/JTi+rYOMImujG+Ekhev5Cvo0vI1DYDnrDxqzllq4D75YKCrcyA==@vger.kernel.org
X-Gm-Message-State: AFuF++mQrCxSlPBkIqj3hGk4mBFxW8kX94soC3pXrULGtmGX+DUpJmFQ
	0Oono7aTi+gP++oQKHx9b6FvT6+Z8o5LHiaXgNoPGyU7I0MDFQDgn0gCiXORInNMXtLPYK9ay4N
	hEQhd14PBd4d/WqRJ0/1nx5WCFgwcvVhxmwDqo0gp+mIp1SI/rqh4jABVOujB2al5TVYzqP4RvQ
	==
X-Gm-Gg: AYBFou2d5qPpG+SDjSwMVwFDepkwHTFc6BuRKOY8G+F8yqsWGyInxebudjRPSb4va5S
	KJVJ83nBqCE20VavdInP7wV0zcm7OoGZxNTzJOjf0uy1w+XjaLVrLcv7sMt00T6KwblGpM5sPXm
	mBuGe+2xOvm2XxNORTmkCmHhVi4i38cy/MmloHln8qEisSEDHVZZllf8D3Nr7dfDTKZ8QlKguOz
	w/eFnVddpiq5MHgW1/gUdGZz2zxo+k3pveWQlNhrilJFx7LHeAOTk6kWVoJBgZDFTFKP8MECh3/
	WAnEnfXJytujFoTuT6R4s+2kS6G/gxI1H13xhLPDP51HUr1fWH21auDpVzpL6Qen4nN85keSgJB
	PDORpqhXdBHZfWp6idAcNs3M=
X-Received: by 2002:a05:620a:4888:b0:937:3aae:1385 with SMTP id af79cd13be357-93bb76e453cmr671860585a.11.1789591603026;
        Wed, 16 Sep 2026 13:46:43 -0700 (PDT)
X-Received: by 2002:a05:620a:4888:b0:937:3aae:1385 with SMTP id af79cd13be357-93bb76e453cmr671855685a.11.1789591602580;
        Wed, 16 Sep 2026 13:46:42 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.214])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4870bf1fa7dsm9857077f8f.8.2026.09.16.13.46.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2026 13:46:41 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Wed, 16 Sep 2026 22:46:32 +0200
Subject: [PATCH 1/3] dtc: dt-check-style: Introduce way to disable checks
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260916-b4-dts-style-checker-suppress-v1-1-81b86685d068@oss.qualcomm.com>
References: <20260916-b4-dts-style-checker-suppress-v1-0-81b86685d068@oss.qualcomm.com>
In-Reply-To: <20260916-b4-dts-style-checker-suppress-v1-0-81b86685d068@oss.qualcomm.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Saravana Kannan <saravanak@kernel.org>,
        cros-qcom-dts-watchers@chromium.org,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Peter Griffin <peter.griffin@linaro.org>,
        Alim Akhtar <alim.akhtar@samsung.com>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=12124;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=+39inuOtk6dvWrV4F97ZO+lWq6rs7jFZ3XYSkUU3Fnc=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBqqwArlUKzY+H14ISF+z0eYpd51l7pctWiN7s5v
 6eHTfQRa2qJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaqsAKwAKCRDBN2bmhouD
 13RZD/0d3+cV8drCD4DEHLJYopCkMUyaCCSHYuNoBs/OL96OafohnyVrYTuP9FabCI9znb0k0b0
 Ps1M2xBPSI8Ir7zIo856Adrpk4F1k6eejLJKX+r+2wEoS9uJ4NSwNZC7dcbDQkdlyNYrY7UhuZn
 IBHkoladbBDfL4NYFr9vvqrwW4/VbY7Ej324lQacI/WJ5tiHESeSaCqFw+vzcHnOVaCNMQ1mgQU
 EKOUE/+wu8ZLMixCum0rweC4O3+M7K0MUXVH4Tx3IzI6yJaUheED6PnM6bCkYSPjKbTwhbiXSuX
 ltdnkR8w9/0/SEFxR3jq5EO4/AHExLTE3ivPcTBYtodpizfOsePrtiG1djvVvONk4E8inyCH8Qb
 Kt5HKKzlrWN778o9l+rKB1SVqy6/wylm0/I1JEFrXCPAfXsEoif4ef0svul38ox3lvW24RG50zp
 Ou7qhlNZzfKkKjh9/RJ944IulgoO9wmQA3OaugNWDSqKs93mbhlWwS+PALRn61gFiTGkf1xKp3B
 ope0VmJb7A9c29XrC2k2oa3MpEsSMfZ+cYD5kp9i8vb5MZrVH1kw0+ZVqPnNuWt8gRhhoHCbPWw
 JlGZfHLogvDqm3sMPAOOEZv3MZXCfKFS+1KT+ivFRUT1F+v160yzOmF0Ekzn32c8BVw9goL3v1s
 ZcDYInCXHgTFj+Q==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE2MDI4OCBTYWx0ZWRfX5rXvMDaFufHp
 hm8jYnYAFZZYp+ydvggK0K+2EO63VIyClFJuHQHbqr/lPtnvWH4SiLcYXDx+fVrVXqjoBhgwLBP
 ti5Pn7Z0MTBn6EHBefoJGuPChAzSgjbBhxqBuXTnIGDpvMilEg6lRTcr7+n+TLQ2Vf58n9RX/5q
 8IWQZ1P73XAn/3mxN2Y+Wb6oV1ewj70svlhst89M+cakzp7VGdQfJhNq0HMgXx8IxpogGmxfE7s
 WKh1YrW1C2yy8HhwFAqUAsEujXG5i3rkpD440jEG3fgJAbSrtqhcbqT1YjLkz8+takkTY1QJLj9
 AoMWaDYQnHtdEGOGg5UqxiSDtDcCKXiYaRCnU4nC23AF+5UGwSJ2QTejUImHs7k+lIZMQPwswGx
 nsw/VnCUgaJScmrj/1xWBXiqwhlNf5wOkUiN03Z2TkMRvezhH7ujoUPKt5rnGk63hW25h4/Ze44
 Y8QzKi1ZRsyGWOIrB5g==
X-Proofpoint-GUID: jkhqpXU516d2Asyw7zCsz_p0nSXeXACT
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE2MDI4OCBTYWx0ZWRfX4lWjwiZHrnrA
 jFN1dps5MHpe0wIYct+7LGzX+VKxz5WT1GBr88gq8QYkiXvd7DvZBR8vhMnW1KJXbeeOAfujHUS
 6cbvm2EK0CUlUDrO9cdoAYLLpI+Mi28=
X-Proofpoint-ORIG-GUID: jkhqpXU516d2Asyw7zCsz_p0nSXeXACT
X-Authority-Analysis: v=2.4 cv=F/DC5ahN c=1 sm=1 tr=0 ts=6aab0034 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=+bKQE0WJfmhK2875HamI0Q==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=bBYTsk_4rKjt0MGUfhwA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-16_03,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 adultscore=0 bulkscore=0 clxscore=1015
 spamscore=0 phishscore=0 impostorscore=0 suspectscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609160288

There is a lot of old DTS code, predating stricter DTS Coding Style,
which is not worth fixing, because of impact on backporting changes.
There are also patterns which violate strict rules but make code a bit
more readable.

Introduce shellcheck-style way of disabling specific rules in comments
in DTS:
  /* dt-check-style disable=RULE,RULE... */
e.g.
  /* dt-check-style disable=redundant-whitespace-strict */

which can be placed in :
1. Top-level comment block of a file: applies to entire DTS file,
2. Before new node: applies to that node only,
3. Before a property: applies to that property only.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 scripts/dtc/dt-check-style                         | 97 +++++++++++++++++++++-
 scripts/dtc/dt-style-selftest/bad/dts-suppress.dts | 52 ++++++++++++
 .../expected/dts-suppress.dts.txt                  |  8 ++
 .../dt-style-selftest/good/dts-suppress-file.dts   | 51 ++++++++++++
 .../good/dts-suppress-nodes-properties.dts         | 49 +++++++++++
 5 files changed, 256 insertions(+), 1 deletion(-)

diff --git a/scripts/dtc/dt-check-style b/scripts/dtc/dt-check-style
index b8c40873905c..96f9c10a70b0 100755
--- a/scripts/dtc/dt-check-style
+++ b/scripts/dtc/dt-check-style
@@ -54,6 +54,8 @@ re_cpp_directive = re.compile(
 re_dtc_directive = re.compile(
     r'^/(dts-v1|include)/')
 
+re_check_disable = re.compile(r'\*\s*dt-check-style\s+disable=(\S+)')
+
 # label: name@addr {  -- label and addr optional; name can be "/"
 # Per the DT spec a node name may start with a digit (e.g. 1wire@...).
 # The address part is captured loosely (any non-space, non-brace run) so
@@ -342,6 +344,94 @@ class Rule:
         self.applies_to = applies_to   # input types this rule covers
 
 
+class Suppressions:
+    """Parse ``/* dt-check-style disable=RULE,RULE,RULE`` comments.
+
+    Returns a dict mapping line numbers (1-based) to sets of suppressed
+    rule names.  Three scopes are recognised:
+
+    - **File-level**: the disable comment appears in the top comments of
+      the block (every line before it is blank or a comment -- no code,
+      no preprocessor directives).  The listed rules are suppressed for
+      *every* line in the block.
+
+    - **Node-level**: the disable comment immediately precedes a
+      NODE_OPEN (only blank/comment lines may appear between them).  The
+      listed rules are suppressed for all lines from the opening brace to
+      the matching closing brace, inclusive (nested children included).
+
+    - **Property-level**: the disable comment immediately precedes a
+      PROPERTY line.  The listed rules are suppressed for that property
+      line and all its continuation lines.
+
+    A disable comment that is not in the top comments and whose next
+    non-comment/non-blank line is neither NODE_OPEN nor PROPERTY is
+    silently ignored.
+    """
+
+    def __init__(self, lines):
+        self.__COMMENT_LIKE = (LineType.BLANK, LineType.COMMENT,
+                             LineType.COMMENT_START, LineType.COMMENT_BODY,
+                             LineType.COMMENT_END)
+        self.__suppressed = {}
+
+        for i, dl in enumerate(lines):
+            if dl.linetype not in (LineType.COMMENT, LineType.COMMENT_START, LineType.COMMENT_BODY):
+                continue
+            m = re_check_disable.search(dl.stripped)
+            if not m:
+                continue
+            rules = {r for r in m.group(1).split(',') if r}
+            if not rules:
+                continue
+
+            # File-level: every line before this one is blank or a comment.
+            if all(lines[j].linetype in self.__COMMENT_LIKE for j in range(i)):
+                self._suppress_range(lines, 0, len(lines) - 1, rules)
+                continue
+
+            # Find the next non-comment/non-blank line after the disable comment.
+            next_idx = next(
+                (j for j in range(i + 1, len(lines))
+                if lines[j].linetype not in self.__COMMENT_LIKE),
+                None)
+            if next_idx is None:
+                continue
+
+            nxt = lines[next_idx]
+            if nxt.linetype == LineType.NODE_OPEN:
+                # Node-level: suppress from NODE_OPEN to its matching NODE_CLOSE.
+                node_depth = nxt.depth
+                end_idx = len(lines) - 1
+                for j in range(next_idx + 1, len(lines)):
+                    if (lines[j].linetype == LineType.NODE_CLOSE and
+                            lines[j].depth == node_depth):
+                        end_idx = j
+                        break
+                self._suppress_range(lines, next_idx, end_idx, rules)
+            elif nxt.linetype == LineType.PROPERTY:
+                # Property-level: suppress the property and its continuations.
+                self._add(nxt.lineno, rules)
+                for cont in nxt.continuations:
+                    self._add(cont.lineno, rules)
+
+
+    def _add(self, lineno, rules):
+        self.__suppressed.setdefault(lineno, set()).update(rules)
+
+
+    def _suppress_range(self, lines, start_idx, end_idx, rules):
+        for i in range(start_idx, min(end_idx + 1, len(lines))):
+            dl = lines[i]
+            self._add(dl.lineno, rules)
+            for cont in dl.continuations:
+                self._add(cont.lineno, rules)
+
+
+    def is_suppressed(self, rule_name, lineno):
+        return rule_name in self.__suppressed.get(lineno, set())
+
+
 # --- individual rule check functions --------------------------------------
 
 
@@ -642,6 +732,9 @@ def check_line_length(ctx):
     """Lines must not exceed 80 columns; tabs count as 8 (see
     _display_col)."""
     for dl in ctx.lines:
+        # Ignore suppression rules, which can go longer than 80
+        if re_check_disable.search(dl.stripped):
+            continue
         yield from _check_line_length(dl)
         for cont in dl.continuations:
             yield from _check_line_length(cont)
@@ -1180,10 +1273,12 @@ def check_block(text, mode, file_type):
     lines = classify_lines(text)
     ctx = Ctx(lines, text, mode, file_type)
     rules = select_rules(mode, file_type)
+    suppressions = Suppressions(lines)
     findings = []
     for r in rules:
         for lineno, msg in r.check(ctx):
-            findings.append((lineno, r.name, msg))
+            if not suppressions.is_suppressed(r.name, lineno):
+                findings.append((lineno, r.name, msg))
     findings.sort(key=lambda t: (t[0], t[1]))
     return findings
 
diff --git a/scripts/dtc/dt-style-selftest/bad/dts-suppress.dts b/scripts/dtc/dt-style-selftest/bad/dts-suppress.dts
new file mode 100644
index 000000000000..1602dc74776c
--- /dev/null
+++ b/scripts/dtc/dt-style-selftest/bad/dts-suppress.dts
@@ -0,0 +1,52 @@
+// SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+/dts-v1/;
+
+/ {
+	#address-cells = <1>;
+	#size-cells = <1>;
+
+	memory@a0000000 {
+		device_type = "memory";
+		reg = <0x0 0xa0000000 0x0 0x0>;
+	};
+
+	/* Wrong rule suppressed */
+	/* dt-check-style disable=child-address-order */
+	a55-pmu {
+		compatible = "example,pmu";
+	};
+
+	soc@0 {
+		compatible = "simple-bus";
+		ranges = <0 0 0 0xc0000000>;
+
+		#address-cells = <1>;
+		#size-cells = <1>;
+
+		/* Should not affect the node after this one */
+		/* dt-check-style disable=hex-case */
+		interrupt-controller@10000 {
+			compatible = "example,intc";
+			reg = <0x10000 0x1000>;
+			/* Wrong rule suppressed */
+			/* dt-check-style disable=continuation-alignment */
+			interrupts =  <1 2 3>;
+		};
+
+		serial@30000 {
+			compatible = "example,serial";
+			/* dt-check-style disable=continuation-alignment */
+			reg =  <0x30000 0xDEAD>,
+				<0x30000 0xDEAD>;
+			/* Ignored suppression not followed by node open or property */
+			/* dt-check-style disable=child-address-order */
+		};
+
+		/* Wrong rule suppressed */
+		/* dt-check-style disable=child-name-order */
+		serial@20000 {
+			compatible  = "example,serial";
+			reg = <0x20000 0x1000>;
+		};
+	};
+};
diff --git a/scripts/dtc/dt-style-selftest/expected/dts-suppress.dts.txt b/scripts/dtc/dt-style-selftest/expected/dts-suppress.dts.txt
new file mode 100644
index 000000000000..8d1e7ee4db27
--- /dev/null
+++ b/scripts/dtc/dt-style-selftest/expected/dts-suppress.dts.txt
@@ -0,0 +1,8 @@
+# mode=strict
+bad/dts-suppress.dts:15: [child-name-order] child node 'a55-pmu' out of name order
+bad/dts-suppress.dts:33: [redundant-whitespace-strict] extra whitespace after =
+bad/dts-suppress.dts:39: [hex-case] hex literal '0xDEAD' must be lowercase
+bad/dts-suppress.dts:39: [redundant-whitespace-strict] extra whitespace after =
+bad/dts-suppress.dts:40: [hex-case] hex literal '0xDEAD' must be lowercase
+bad/dts-suppress.dts:47: [child-address-order] child node @20000 out of address order
+bad/dts-suppress.dts:48: [redundant-whitespace-strict] extra whitespace before =
diff --git a/scripts/dtc/dt-style-selftest/good/dts-suppress-file.dts b/scripts/dtc/dt-style-selftest/good/dts-suppress-file.dts
new file mode 100644
index 000000000000..8c3220ed27c7
--- /dev/null
+++ b/scripts/dtc/dt-style-selftest/good/dts-suppress-file.dts
@@ -0,0 +1,51 @@
+// SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+/* dt-check-style disable=redundant-whitespace-strict */
+/*
+ * Here goes reason
+ * dt-check-style disable=continuation-alignment
+ */
+/dts-v1/;
+
+/ {
+	#address-cells = <1>;
+	#size-cells = <1>;
+
+	memory@a0000000 {
+		device_type = "memory";
+		reg = <0x0 0xa0000000 0x0 0x0>;
+	};
+
+	/* dt-check-style disable=child-name-order */
+	a55-pmu {
+		compatible = "example,pmu";
+	};
+
+	soc@0 {
+		compatible = "simple-bus";
+		ranges = <0 0 0 0xc0000000>;
+
+		#address-cells = <1>;
+		#size-cells = <1>;
+
+		interrupt-controller@10000 {
+			compatible = "example,intc";
+			reg = <0x10000 0x1000>;
+			interrupts =  <1 2 3>;
+		};
+
+		/* dt-check-style disable=hex-case */
+		serial@30000 {
+			compatible = "example,serial";
+			reg =  <0x30000 0xDEAD>,
+				<0x30000 0xDEAD>;
+		};
+
+		/* dt-check-style disable=child-address-order */
+		serial@20000 {
+			compatible  = "example,serial";
+			/* Redundant rule disable should be ignored */
+			/* dt-check-style disable=hex-case */
+			reg = <0x20000 0x1000>;
+		};
+	};
+};
diff --git a/scripts/dtc/dt-style-selftest/good/dts-suppress-nodes-properties.dts b/scripts/dtc/dt-style-selftest/good/dts-suppress-nodes-properties.dts
new file mode 100644
index 000000000000..e65b152cfa1e
--- /dev/null
+++ b/scripts/dtc/dt-style-selftest/good/dts-suppress-nodes-properties.dts
@@ -0,0 +1,49 @@
+// SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+/dts-v1/;
+
+/ {
+	#address-cells = <1>;
+	#size-cells = <1>;
+
+	memory@a0000000 {
+		device_type = "memory";
+		reg = <0x0 0xa0000000 0x0 0x0>;
+	};
+
+	/* dt-check-style disable=child-name-order */
+	a55-pmu {
+		compatible = "example,pmu";
+	};
+
+	soc@0 {
+		compatible = "simple-bus";
+		ranges = <0 0 0 0xc0000000>;
+
+		#address-cells = <1>;
+		#size-cells = <1>;
+
+		interrupt-controller@10000 {
+			compatible = "example,intc";
+			reg = <0x10000 0x1000>;
+			/* dt-check-style disable=redundant-whitespace-strict */
+			interrupts =  <1 2 3>;
+		};
+
+		/* dt-check-style disable=hex-case */
+		serial@30000 {
+			compatible = "example,serial";
+			/* dt-check-style disable=continuation-alignment,redundant-whitespace-strict */
+			reg =  <0x30000 0xDEAD>,
+				<0x30000 0xDEAD>;
+		};
+
+		/* dt-check-style disable=child-address-order */
+		serial@20000 {
+			/* dt-check-style disable=redundant-whitespace-strict */
+			compatible  = "example,serial";
+			/* Redundant rule disable should be ignored */
+			/* dt-check-style disable=hex-case */
+			reg = <0x20000 0x1000>;
+		};
+	};
+};

-- 
2.53.0

