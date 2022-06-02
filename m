Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D782DC43334
	for <linux-samsung-soc@archiver.kernel.org>; Thu,  2 Jun 2022 10:10:40 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233094AbiFBKKh (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Thu, 2 Jun 2022 06:10:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42230 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230406AbiFBKKg (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 2 Jun 2022 06:10:36 -0400
Received: from mailout1.samsung.com (mailout1.samsung.com [203.254.224.24])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E1DEE2AD5C2
        for <linux-samsung-soc@vger.kernel.org>; Thu,  2 Jun 2022 03:10:34 -0700 (PDT)
Received: from epcas2p2.samsung.com (unknown [182.195.41.54])
        by mailout1.samsung.com (KnoxPortal) with ESMTP id 20220602101030epoutp01e7e5f5cad3b4b073ea6ce5913e1fb43b~0xfeDmADl0612406124epoutp01_
        for <linux-samsung-soc@vger.kernel.org>; Thu,  2 Jun 2022 10:10:30 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.samsung.com 20220602101030epoutp01e7e5f5cad3b4b073ea6ce5913e1fb43b~0xfeDmADl0612406124epoutp01_
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1654164630;
        bh=7koIz/DVucBKimOwAVWE0zWB8XnPg8smoktAvfpidIs=;
        h=From:To:Cc:In-Reply-To:Subject:Date:References:From;
        b=SyUD3e+Uv/SsYcgNF/K8P5bOqj6SBv4rziub1PyPZzluhw6EUPghpUJjwWDgq4Gm/
         PoApE7MOK9g+eY/16bSjgePYXRNn3GMaaBJgdhpyHSaA9V35iVmWSLPno9+HsoyNeE
         61sZr40AJ7SZMjajtwTFU5qKPGY4Oakt+F9ZIBjE=
Received: from epsnrtp3.localdomain (unknown [182.195.42.164]) by
        epcas2p1.samsung.com (KnoxPortal) with ESMTP id
        20220602101029epcas2p1ed37f5efcef816e7b5631b2c5ed6d998~0xfdcNpuY1582215822epcas2p15;
        Thu,  2 Jun 2022 10:10:29 +0000 (GMT)
Received: from epsmges2p3.samsung.com (unknown [182.195.36.98]) by
        epsnrtp3.localdomain (Postfix) with ESMTP id 4LDMGC6qpRz4x9Pp; Thu,  2 Jun
        2022 10:10:27 +0000 (GMT)
Received: from epcas2p1.samsung.com ( [182.195.41.53]) by
        epsmges2p3.samsung.com (Symantec Messaging Gateway) with SMTP id
        33.0B.10028.39C88926; Thu,  2 Jun 2022 19:10:27 +0900 (KST)
Received: from epsmtrp2.samsung.com (unknown [182.195.40.14]) by
        epcas2p4.samsung.com (KnoxPortal) with ESMTPA id
        20220602101027epcas2p41c9f5360805c7aa8479560bae156286e~0xfbbOhHn2389023890epcas2p4T;
        Thu,  2 Jun 2022 10:10:27 +0000 (GMT)
Received: from epsmgms1p1new.samsung.com (unknown [182.195.42.41]) by
        epsmtrp2.samsung.com (KnoxPortal) with ESMTP id
        20220602101027epsmtrp2fb1a4c04dfb28473f8df4503086c9b8a~0xfbWXZsj2707927079epsmtrp2O;
        Thu,  2 Jun 2022 10:10:27 +0000 (GMT)
X-AuditID: b6c32a47-573ff7000000272c-45-62988c93388a
Received: from epsmtip1.samsung.com ( [182.195.34.30]) by
        epsmgms1p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
        14.BC.11276.29C88926; Thu,  2 Jun 2022 19:10:27 +0900 (KST)
Received: from KORCO082417 (unknown [10.229.8.121]) by epsmtip1.samsung.com
        (KnoxPortal) with ESMTPA id
        20220602101026epsmtip1e563cad0eb0f88870ebbd2945dffbc82~0xfbLn3tS2748227482epsmtip1d;
        Thu,  2 Jun 2022 10:10:26 +0000 (GMT)
From:   "Chanho Park" <chanho61.park@samsung.com>
To:     "'Krzysztof Kozlowski'" <krzysztof.kozlowski@linaro.org>,
        "'Kishon Vijay Abraham I'" <kishon@ti.com>,
        "'Vinod Koul'" <vkoul@kernel.org>,
        "'Alim Akhtar'" <alim.akhtar@samsung.com>,
        "'Rob Herring'" <robh+dt@kernel.org>,
        "'Krzysztof Kozlowski'" <krzysztof.kozlowski+dt@linaro.org>
Cc:     <devicetree@vger.kernel.org>, <linux-phy@lists.infradead.org>,
        <linux-samsung-soc@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>
In-Reply-To: <b16915f7-a4b7-4512-77fb-b2cdd8e7cdb4@linaro.org>
Subject: RE: [PATCH v2 1/6] dt-bindings: phy: samsung,ufs-phy: make
 pmu-syscon as phandle-array
Date:   Thu, 2 Jun 2022 19:10:26 +0900
Message-ID: <035e01d87668$fb2bfcf0$f183f6d0$@samsung.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQLWkTnA63V9WykH3rm22/0hqLdk6gLMec0AAc0/rTIBlco14ALgFz+bqvcxoOA=
Content-Language: ko
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrDJsWRmVeSWpSXmKPExsWy7bCmqe7knhlJBvOfG1s8mLeNzWL+kXOs
        Fhee9rBZ9L14yGyx9/VWdotNj6+xWkxY9Y3FYsb5fUwWrXuPsFvsvHOC2YHLY9OqTjaPO9f2
        sHlsXlLv0bdlFaPH8RvbmTw+b5ILYIvKtslITUxJLVJIzUvOT8nMS7dV8g6Od443NTMw1DW0
        tDBXUshLzE21VXLxCdB1y8wBukxJoSwxpxQoFJBYXKykb2dTlF9akqqQkV9cYquUWpCSU2Be
        oFecmFtcmpeul5daYmVoYGBkClSYkJ3R+3EyY8El3ormT9uYGxhXcHUxcnJICJhITDqxhqWL
        kYtDSGAHo0TPp49MEM4nRonmS5OhnG+MEvu33WGFaZl48TA7RGIvo8TsVVtZIZwXjBIbfy1m
        AqliE9CXeNmxDSwhIjCfSeJp51WwBLPABEaJlZ+8QWxOATuJdyu7WUBsYYFEietTXzGC2CwC
        KhKH/kDYvAKWEhN/zmGHsAUlTs58wgIxR1ti2cLXzBAnKUj8fLoM7DwRAT+Jj/8XMkPUiEjM
        7mxjBjlCQmALh8STmVOYIBpcJObv2s8OYQtLvDq+BcqWkvj8bi8bhF0ssXTWJyaI5gZGicvb
        fkEljCVmPWsHuo4DaIOmxPpd+iCmhICyxJFbULfxSXQc/ssOEeaV6GgTgmhUlziwfToLhC0r
        0T3nM+sERqVZSD6bheSzWUg+mIWwawEjyypGsdSC4tz01GKjAmN4dCfn525iBCdbLfcdjDPe
        ftA7xMjEwXiIUYKDWUmEt2TX1CQh3pTEyqrUovz4otKc1OJDjKbAsJ7ILCWanA9M93kl8YYm
        lgYmZmaG5kamBuZK4rxeKRsShQTSE0tSs1NTC1KLYPqYODilGphiWebtWNByLaMv+4cty978
        k/qS0ss4mr/N2yvoEWD+7/vM8moJ1QBD1+osg6tTdj15vNjQ+/6X4yxGpbs890TMeJ3w/PSh
        nCqZtviqJR+8Q5a8Kn0ss/aDs3TTx7a9mZ4Kf1MbhDu/J6338n3Gd6vuyYVNHxRFFTQ2sHwu
        M92YeeS0rpmgNFtPYfpktvcp3lsLBRTLZ57t00vi00i9/ZpvzZkr0W+F3aMNjx99tdj/q2cm
        u1t26rStnZPcF1tyr52l77xqYVS68M/dD4VX14WpPfb/xOYpV1nt4fbQ2S/t/5mKGbbaOY4c
        IbvPFVxbKFiZfl3u9ZHfC6dH86pUzdS587NW8QuDYcGWvL1Wm5VYijMSDbWYi4oTAWfE65g/
        BAAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprJIsWRmVeSWpSXmKPExsWy7bCSnO7knhlJBrNuMFo8mLeNzWL+kXOs
        Fhee9rBZ9L14yGyx9/VWdotNj6+xWkxY9Y3FYsb5fUwWrXuPsFvsvHOC2YHLY9OqTjaPO9f2
        sHlsXlLv0bdlFaPH8RvbmTw+b5ILYIvisklJzcksSy3St0vgyljXdI+lYA9vxbezL1gbGPu4
        uhg5OSQETCQmXjzM3sXIxSEksJtRYu2Ee8wQCVmJZ+92sEPYwhL3W46wQhQ9Y5T4/30/E0iC
        TUBf4mXHNrCEiMBiJon+E2fZQBxmgSmMEpevvmSBaFnOJDH7/XGwWZwCdhLvVnazgNjCAvES
        H+70s4HYLAIqEof+vGIEsXkFLCUm/pzDDmELSpyc+QSsnllAW+Lpzadw9rKFr6FuVZD4+XQZ
        K4gtIuAn8fH/QmaIGhGJ2Z1tzBMYhWchGTULyahZSEbNQtKygJFlFaNkakFxbnpusWGBYV5q
        uV5xYm5xaV66XnJ+7iZGcOxpae5g3L7qg94hRiYOxkOMEhzMSiK8JbumJgnxpiRWVqUW5ccX
        leakFh9ilOZgURLnvdB1Ml5IID2xJDU7NbUgtQgmy8TBKdXAJGfqbSg3/ahtpdlx8wClQ3qy
        bRckVvjXT3J/5NB4z0A1xTwg/F/ZPU3DYxekI5/0LL19UZV7trvtHYXJvrYi6+buPLTR4v+E
        /iPTwmavbFv2dOlv/91Pt+f8OyH9dDLPX+P26JLSuCU737618mVera+bra5+47yE/QrFxjz7
        +b4C/O9v/d+8y3PvN+Za/8UdIasusv3+8U51Uzpf943r178x/ZpfE9dbktalWBh4KFXaZHfu
        TfaGRzr/hKVFn3N5fSrpaGxI+Oh+2NWz7r/GRWf7LPsVaoKPyk9dOiKgoPFoRxe77jH5N8vU
        3DcFd/evWcoj9CVHcnnG9ccxjfubdiurv3xx/8r523suJwa9VmIpzkg01GIuKk4EAGe7vdMs
        AwAA
X-CMS-MailID: 20220602101027epcas2p41c9f5360805c7aa8479560bae156286e
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20220602053329epcas2p4c2baca2d161814f5d51dc48722f904b1
References: <20220602053250.62593-1-chanho61.park@samsung.com>
        <CGME20220602053329epcas2p4c2baca2d161814f5d51dc48722f904b1@epcas2p4.samsung.com>
        <20220602053250.62593-2-chanho61.park@samsung.com>
        <44fceb66-fd33-4b2d-fe8e-9a1a5837a51a@linaro.org>
        <b16915f7-a4b7-4512-77fb-b2cdd8e7cdb4@linaro.org>
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

> >>    samsung,pmu-syscon:
> >> -    =24ref: '/schemas/types.yaml=23/definitions/phandle'
> >> -    description: phandle for PMU system controller interface, used to
> >> -                 control pmu registers bits for ufs m-phy
> >> +    =24ref: '/schemas/types.yaml=23/definitions/phandle-array'
> >> +    items:
> >> +      minItems: 1
> >> +      items:
> >> +        - description: phandle for PMU system controller interface, u=
sed
> to
> >> +                       control pmu registers bits for ufs m-phy
> >> +        - description: offset of the pmu control register
> >
> > This does not work... Please test your bindings with different cases.
>=20
> Just to be clear - when I mentioned that minItems should be on second
> items level, I meant it should affect the second items list, not the firs=
t.
> Now you can have 1, 2 or 10 phandles.

I put the minItems to the second level as you mentioned but I got below err=
or from dt_binding_check.

--- a/Documentation/devicetree/bindings/phy/samsung,ufs-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/samsung,ufs-phy.yaml
=40=40 -42,8 +42,8 =40=40 properties:
   samsung,pmu-syscon:
     =24ref: '/schemas/types.yaml=23/definitions/phandle-array'
     items:
-      minItems: 1
       items:
+        - minItems: 1
         - description: phandle for PMU system controller interface, used t=
o
                        control pmu registers bits for ufs m-phy
         - description: offset of the pmu control register

=24 make dt_binding_check DT_SCHEMA_FILES=3DDocumentation/devicetree/bindin=
gs/phy/samsung,ufs-phy.yaml
ufs-phy=4015571800: samsung,pmu-syscon:0: =5B4294967295, 1828=5D is too sho=
rt

Best Regards,
Chanho Park

