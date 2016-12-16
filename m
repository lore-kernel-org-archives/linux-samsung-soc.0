From: Pankaj Dubey <pankaj.dubey@samsung.com>
Subject: [PATCH 0/2] s5p-mfc fix for using reserved memory
Date: Fri, 16 Dec 2016 17:18:33 +0530
Message-ID: <1481888915-19624-1-git-send-email-pankaj.dubey@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: javier@osg.samsung.com, mchehab@osg.samsung.com, Pankaj Dubey <pankaj.dubey@samsung.com>, krzk@kernel.org, jtp.park@samsung.com, kyungmin.park@samsung.com, kgene@kernel.org, hans.verkuil@cisco.com, mchehab@kernel.org
List-Id: linux-samsung-soc@vger.kernel.org

It has been observed on ARM64 based Exynos SoC, if IOMMU is not enabled
and we try to use reserved memory for MFC, reqbufs fails with below
mentioned error
---------------------------------------------------------------------------
V4L2 Codec decoding example application
Kamil Debski <k.debski@samsung.com>
Copyright 2012 Samsung Electronics Co., Ltd.

Opening MFC.
(mfc.c:mfc_open:58): MFC Info (/dev/video0): driver="s5p-mfc" \
bus_info="platform:12c30000.mfc0" card="s5p-mfc-dec" fd=0x4[
42.339165] Remapping memory failed, error: -6

MFC Open Success.
(main.c:main:711): Successfully opened all necessary files and devices
(mfc.c:mfc_dec_setup_output:103): Setup MFC decoding OUTPUT buffer \
size=4194304 (requested=4194304)
(mfc.c:mfc_dec_setup_output:120): Number of MFC OUTPUT buffers is 2 \
(requested 2)

[App] Out buf phy : 0x00000000, virt : 0xffffffff
Output Length is = 0x300000
Error (mfc.c:mfc_dec_setup_output:145): Failed to MMAP MFC OUTPUT buffer
-------------------------------------------------------------------------
This is because the device requesting for memory is mfc0.left not the parent mfc0.
Hence setting of alloc_devs need to be done only if IOMMU is enabled
and in that case both the left and right device is treated as mfc0 only.
Also we need to populate vb2_queue's dev pointer with mfc dev pointer.

Smitha T Murthy (2):
  media: s5p-mfc: convert drivers to use the new vb2_queue dev field
  media: s5p-mfc: fix MMAP of mfc buffer during reqbufs

 drivers/media/platform/s5p-mfc/s5p_mfc.c     |  2 ++
 drivers/media/platform/s5p-mfc/s5p_mfc_dec.c | 17 ++++++++++-------
 drivers/media/platform/s5p-mfc/s5p_mfc_enc.c | 18 +++++++++++-------
 3 files changed, 23 insertions(+), 14 deletions(-)

-- 
2.7.4
