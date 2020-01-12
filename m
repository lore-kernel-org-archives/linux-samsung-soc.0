Return-Path: <SRS0=k2we=3C=vger.kernel.org=linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AF024C33CAB
	for <linux-samsung-soc@archiver.kernel.org>; Mon, 13 Jan 2020 07:09:56 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 8648E2075B
	for <linux-samsung-soc@archiver.kernel.org>; Mon, 13 Jan 2020 07:09:56 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726976AbgAMHJ4 (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Mon, 13 Jan 2020 02:09:56 -0500
Received: from mail02.vodafone.es ([217.130.24.81]:43579 "EHLO
        mail02.vodafone.es" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725954AbgAMHJ4 (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 13 Jan 2020 02:09:56 -0500
IronPort-SDR: LWMa57wtVfJ8Kf8s6nbkXdQhNMt13uf4t5CDwdizuLlFlk0BJuH81+SZUq2Bg8qsSWC91Fl1qT
 PQBBQoET8sRA==
IronPort-PHdr: =?us-ascii?q?9a23=3AG8cuOBHhT0fgXvo12ovxb51GYnF86YWxBRYc79?=
 =?us-ascii?q?8ds5kLTJ7ypsiwAkXT6L1XgUPTWs2DsrQY0rGQ6f6xEjVYuN6oizMrSNR0TR?=
 =?us-ascii?q?gLiMEbzUQLIfWuLgnFFsPsdDEwB89YVVVorDmROElRH9viNRWJ+iXhpTEdFQ?=
 =?us-ascii?q?/iOgVrO+/7BpDdj9it1+C15pbffxhEiCCybL9vIhi6txvdu8gSjIdtN6o91g?=
 =?us-ascii?q?bFqWZUdupLwm9lOUidlAvm6Meq+55j/SVQu/Y/+MNFTK73Yac2Q6FGATo/K2?=
 =?us-ascii?q?w669HluhfFTQuU+3sTSX4WnQZSAwjE9x71QJH8uTbnu+Vn2SmaOcr2Ta0oWT?=
 =?us-ascii?q?mn8qxmRgPkhDsBOjUk9m3bjdF+g75BrxKkpx1z2pDZYIaPNPpmeaPdZ8kVRX?=
 =?us-ascii?q?ZfUcpISSNBBJqwYpcTD+odJ+lXs4n9qEULrRSgAwmsGPrjxSFOhnPv2qM61O?=
 =?us-ascii?q?IhHh/G3QA5Ad0OtmnfoNH7OasOTey5ya/FxijBYfxLwzfw8IbGfBA7of+SXr?=
 =?us-ascii?q?x+bMXexlUgGQ7eklWdq5DqMy+J2ugRrWSW6fdrW+K1i24grgF8uiKhydkwio?=
 =?us-ascii?q?bXnIIe11DL9SJ/wIY6ONa1T1Z7bsC4EJROrSGbOYx2QsUtQ2xzuCY60aYJto?=
 =?us-ascii?q?KhcCcWz5QnwgTTa/yEc4WR5B/oSeWfIS9giX57Zb6yhQy+/VWux+HgTMW4zl?=
 =?us-ascii?q?lHojBLn9TMsH0Gygbd5dKdSvRn+0eswTOP1wfO5e5aOU00jq/bK4I5wr43i5?=
 =?us-ascii?q?oTrVzPHi/ol0Xyi6+bbkAk9fKp6+TjeLXpuJucO5N7hw3kLKQundGwDv42Mg?=
 =?us-ascii?q?gJWWiU5/6w26P4/UHhQbVKiOM5krXBvZzEOMgWpLS1DxJb34o/8RqzETir3M?=
 =?us-ascii?q?4WkHQHNF5FfQiIj4ntO1HAOvD4CvK/jky0kDh12/DJIKfhA5vKLnjFn7fsZr?=
 =?us-ascii?q?Z961VHxwUv19xQ+5VUCrQbLPLzWU/9rMbYAQMhMwyo3+bnD81w1ocfWWKJH6?=
 =?us-ascii?q?+YP7resUSS6eIqOOmMeYkVuDnkJ/g+4P7hkWQ0mUESfaa3x5sbcnO4Eep8I0?=
 =?us-ascii?q?Wff3Xshs0NEWAQvgoxH6TWjwiGUDhOdzOpVqcn+zc0TZmhBq/dSY23xr+Mxi?=
 =?us-ascii?q?G2GttRfG8VMF2UFWbUcNC8VusBcmqtJclu2mgcWKSsUZAm0x6utw/hwbFPIe?=
 =?us-ascii?q?/d+ylevpXmgotb/erWwCk/6TFuR/ua1W7FG3l5gm4SWDgw04h/ukZ2jFyE1O?=
 =?us-ascii?q?54gKoLRpRo+/pVX1JjZtbnxOtgBoWpAlrM?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: =?us-ascii?q?A2ETKgAZFxxemCMYgtkUBjMYGgEBAQE?=
 =?us-ascii?q?BAQEBAQMBAQEBEQEBAQICAQEBAYF7AgEBFwEBgS6BTVIgEpNQgU0fg0OLY4E?=
 =?us-ascii?q?Agx4VhggTDIFbDQEBAQEBNQIBAYRATgEXgRIkOgQNAgMNAQEFAQEBAQEFBAE?=
 =?us-ascii?q?BAhABAQEBAQYNCwYphUqCHQweAQQBAQEBAwMDAQEMAYNdBxkPOUpMAQ4BU4M?=
 =?us-ascii?q?EgksBATOFHZc6AY0EDQ0ChR2CSQQKgQmBGiOBNgGMGBqBQT+BIyGCKwgBggG?=
 =?us-ascii?q?CfwESAWyCSIJZBI1CEiGBB4gpmBeCQQR2iUyMAoI3AQ+IAYQxAxCCRQ+BCYg?=
 =?us-ascii?q?DhE6BfaM3V4EMDXpxMxqCJhqBIE8YDYgbji1AgRYQAk+JLoIyAQE?=
X-IPAS-Result: =?us-ascii?q?A2ETKgAZFxxemCMYgtkUBjMYGgEBAQEBAQEBAQMBAQEBE?=
 =?us-ascii?q?QEBAQICAQEBAYF7AgEBFwEBgS6BTVIgEpNQgU0fg0OLY4EAgx4VhggTDIFbD?=
 =?us-ascii?q?QEBAQEBNQIBAYRATgEXgRIkOgQNAgMNAQEFAQEBAQEFBAEBAhABAQEBAQYNC?=
 =?us-ascii?q?wYphUqCHQweAQQBAQEBAwMDAQEMAYNdBxkPOUpMAQ4BU4MEgksBATOFHZc6A?=
 =?us-ascii?q?Y0EDQ0ChR2CSQQKgQmBGiOBNgGMGBqBQT+BIyGCKwgBggGCfwESAWyCSIJZB?=
 =?us-ascii?q?I1CEiGBB4gpmBeCQQR2iUyMAoI3AQ+IAYQxAxCCRQ+BCYgDhE6BfaM3V4EMD?=
 =?us-ascii?q?XpxMxqCJhqBIE8YDYgbji1AgRYQAk+JLoIyAQE?=
X-IronPort-AV: E=Sophos;i="5.69,428,1571695200"; 
   d="scan'208";a="323876279"
Received: from mailrel04.vodafone.es ([217.130.24.35])
  by mail02.vodafone.es with ESMTP; 13 Jan 2020 08:09:53 +0100
Received: (qmail 24356 invoked from network); 12 Jan 2020 05:00:20 -0000
Received: from unknown (HELO 192.168.1.3) (quesosbelda@[217.217.179.17])
          (envelope-sender <peterwong@hsbc.com.hk>)
          by mailrel04.vodafone.es (qmail-ldap-1.03) with SMTP
          for <linux-samsung-soc@vger.kernel.org>; 12 Jan 2020 05:00:20 -0000
Date:   Sun, 12 Jan 2020 06:00:20 +0100 (CET)
From:   Peter Wong <peterwong@hsbc.com.hk>
Reply-To: Peter Wong <peterwonghkhsbc@gmail.com>
To:     linux-samsung-soc@vger.kernel.org
Message-ID: <10116048.460773.1578805220779.JavaMail.cash@217.130.24.55>
Subject: Investment opportunity
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Sender: linux-samsung-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Greetings,
Please read the attached investment proposal and reply for more details.
Are you interested in loan?
Sincerely: Peter Wong




----------------------------------------------------
This email was sent by the shareware version of Postman Professional.

