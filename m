From: =?UTF-8?q?Emilio=20L=C3=B3pez?= <emilio.lopez@collabora.co.uk>
Subject: [PATCH 1/3] sysfs: Fix is_visible() support for binary attributes
Date: Tue,  8 Sep 2015 09:07:44 -0300
Message-ID: <1441714066-5599-2-git-send-email-emilio.lopez@collabora.co.uk>
References: <1441714066-5599-1-git-send-email-emilio.lopez@collabora.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from bhuna.collabora.co.uk ([93.93.135.160]:38237 "EHLO
	bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754246AbbIHMI4 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 8 Sep 2015 08:08:56 -0400
In-Reply-To: <1441714066-5599-1-git-send-email-emilio.lopez@collabora.co.uk>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: gregkh@linuxfoundation.org, olof@lixom.net, kgene@kernel.org, k.kozlowski@samsung.com
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, =?UTF-8?q?Emilio=20L=C3=B3pez?= <emilio.lopez@collabora.co.uk>

According to the sysfs header file:

    "The returned value will replace static permissions defined in
     struct attribute or struct bin_attribute."

but this isn't the case, as is_visible is only called on
struct attribute only. This patch adds the code paths required
to support is_visible() on binary attributes.

Signed-off-by: Emilio L=C3=B3pez <emilio.lopez@collabora.co.uk>
---
 fs/sysfs/group.c | 22 ++++++++++++++++++----
 1 file changed, 18 insertions(+), 4 deletions(-)

diff --git a/fs/sysfs/group.c b/fs/sysfs/group.c
index 39a0199..eb6996a 100644
--- a/fs/sysfs/group.c
+++ b/fs/sysfs/group.c
@@ -37,10 +37,10 @@ static int create_files(struct kernfs_node *parent,=
 struct kobject *kobj,
 {
 	struct attribute *const *attr;
 	struct bin_attribute *const *bin_attr;
-	int error =3D 0, i;
+	int error =3D 0, i =3D 0;
=20
 	if (grp->attrs) {
-		for (i =3D 0, attr =3D grp->attrs; *attr && !error; i++, attr++) {
+		for (attr =3D grp->attrs; *attr && !error; i++, attr++) {
 			umode_t mode =3D (*attr)->mode;
=20
 			/*
@@ -73,13 +73,27 @@ static int create_files(struct kernfs_node *parent,=
 struct kobject *kobj,
 	}
=20
 	if (grp->bin_attrs) {
-		for (bin_attr =3D grp->bin_attrs; *bin_attr; bin_attr++) {
+		for (bin_attr =3D grp->bin_attrs; *bin_attr; i++, bin_attr++) {
+			umode_t mode =3D (*bin_attr)->attr.mode;
+
 			if (update)
 				kernfs_remove_by_name(parent,
 						(*bin_attr)->attr.name);
+			if (grp->is_visible) {
+				mode =3D grp->is_visible(kobj,
+						       &(*bin_attr)->attr, i);
+				if (!mode)
+					continue;
+			}
+
+			WARN(mode & ~(SYSFS_PREALLOC | 0664),
+			     "Attribute %s: Invalid permissions 0%o\n",
+			     (*bin_attr)->attr.name, mode);
+
+			mode &=3D SYSFS_PREALLOC | 0664;
 			error =3D sysfs_add_file_mode_ns(parent,
 					&(*bin_attr)->attr, true,
-					(*bin_attr)->attr.mode, NULL);
+					mode, NULL);
 			if (error)
 				break;
 		}
--=20
2.1.4
