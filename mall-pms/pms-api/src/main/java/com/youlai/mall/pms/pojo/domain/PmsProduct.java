package com.youlai.mall.pms.pojo.domain;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.youlai.common.base.BaseEntity;
import lombok.Data;
import lombok.experimental.Accessors;
import org.springframework.data.annotation.Id;
import org.springframework.data.elasticsearch.annotations.Document;

import java.util.List;

/**
 * @author haoxr
 * @date 2020-11-06
 */
@Data
@Accessors(chain = true)
@Document(indexName = "pms_spu", replicas = 1, shards = 1, createIndex = true)
public class PmsProduct extends BaseEntity {

    @Id
    @TableId(type = IdType.AUTO)
    private Long id;
    private String name;
    private Long categoryId;
    private Long brandId;
    private Long originPrice;
    private Long price;
    private Integer sales;
    private String pic;
    private String pics;
    private String unit;
    private String description;
    private String detail;
    private Integer status;

    @TableField(exist = false)
    private String categoryName;

    @TableField(exist = false)
    private String brandName;

    @TableField(exist = false)
    private List<PmsInventory> inventoryList;

    @TableField(exist = false)
    private List<String> picList;
}
